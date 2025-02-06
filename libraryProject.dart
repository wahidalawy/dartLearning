import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> library = [];

void main(List<String> args) {
  // initialize library books
  initLibrary();

  // show menu for users
  printMenu();
  String input = stdin.readLineSync()!;
  while (input != '0') {
    // body of program
    handleUserRequest(input);
    // returnning new menu affter user choise is done
    printMenu();
    input = stdin.readLineSync()!;
  }
  print('GoodBy...');
}

void initLibrary() {
  List<dynamic> books = jsonDecode(File('books.json').readAsStringSync());
  library.addAll(books.cast());
}

void printMenu() {
  print('Enter your choice:');
  print('1: View Books');
  print('2: Add Book');
  print('3: edit books');
  print('4: delet book');
  print('5: search books');
  print('0: exit');
}

void handleUserRequest(String input) {
  switch (input) {
    case '1':
      showAllBooks();
      break;
    case '2':
      addBookRequest();
      break;
    case '3':
      editBook();
      break;
    case '4':
      deleteBook();
      break;
    case '5':
      searchBooks();
      break;
    default:
      print('input was not currect!!\nplease try again...');
  }
}

void showAllBooks() {
  print(
    library
        .map((item) => getBookPritable(item))
        .toList()
        .join('\n----------------------\n'),
  );
}

void addBookRequest() {
  print('Enter new Book title: (Enter 0 for back)');
  String title = stdin.readLineSync()!;
  while (title != '0') {
    if (title.isEmpty) {
      print('Nothig Entered!!\nPlease try again:');
      title = stdin.readLineSync()!;
      continue;
    }
    print('Enter new Book author: (Enter 0 for back)');
    String author = stdin.readLineSync()!;
    while (author != '0') {
      if (author.isEmpty) {
        print('Nothig Entered!!\nPlease try again:');
        author = stdin.readLineSync()!;
        continue;
      }
      print('Book created Succesfuly:');
      print(getBookPritable(addBook(title, author)));
      print('------------------------------------');
      break;
    }
    break;
  }
}

Map<String, dynamic> addBook(String title, String author) {
  int id = library.last['id'] + 1;
  Map<String, dynamic> addedBook = {'id': id, 'title': title, 'author': author};
  library.add(addedBook);
  if (syncLibraryWithDB()) {
    print('Data Stored!');
  }
  return addedBook;
}

bool syncLibraryWithDB() {
  try {
    String booksJson = jsonEncode(library);
    File('./books.json').writeAsStringSync(booksJson);
    return true;
  } catch (ex) {
    return false;
  }
}

void editBook() {}
void deleteBook() {}
void searchBooks() {}

String getBookPritable(Map<String, dynamic> book) {
  String output =
      "id: ${book['id']}\ttitle: ${book['title']}\tauthor: ${book['author']}";
  return output;
}
