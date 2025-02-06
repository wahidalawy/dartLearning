import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> library = [];

String bookDBAddress = 'books.json';

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
  if (File(bookDBAddress).existsSync()) {
    String booksContent = File(bookDBAddress).readAsStringSync();
    if (booksContent.isNotEmpty) {
      List<dynamic> books = jsonDecode(booksContent);
      library.addAll(books.cast());
    }
  } else {
    File(bookDBAddress).createSync();
  }
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
      editBookRequest();
      break;
    case '4':
      deleteBookRequest();
      break;
    case '5':
      searchBooksRequest();
      break;
    default:
      print('input was not currect!!\nplease try again...');
  }
}

void showAllBooks() {
  print(
    library.where((item) => !item.containsKey('is_deleted')).map((item) => getBookPrintable(item)).toList().join('\n----------------------\n'),
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
      print(getBookPrintable(addBook(title, author)));
      print('------------------------------------');
      break;
    }
    break;
  }
}

Map<String, dynamic> addBook(String title, String author) {
  int id = library.isNotEmpty ? library.last['id'] + 1 : 1;
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
    File(bookDBAddress).writeAsStringSync(booksJson);
    return true;
  } catch (ex) {
    return false;
  }
}

void editBookRequest() {
  int? id = getBookId();
  if (id != null) {
    printBookByID(id);
    print('Enter the Select:\n1: Edit Book Title\n2: Edit Book Author');
    String input = stdin.readLineSync()!;
    while (input != '0') {
      switch (input) {
        case '1':
          var result = editBook(id, EditMode.title);
          if (result != null) {
            print('Book Title edited Succesfuly:');
            print(getBookPrintable(result));
            print('------------------------------------');
          }
          break;
        case '2':
          var result = editBook(id, EditMode.author);
          if (result != null) {
            print('Book Author edited Succesfuly:');
            print(getBookPrintable(result));
            print('------------------------------------');
          }
          break;
        default:
          print('input was not currect!!\nplease try again...');
      }
      break;
    }
  }
}

enum EditMode { title, author }

Map<String, dynamic>? editBook(int bookID, EditMode mode) {
  int bookIndex = library.indexWhere((item) => item['id'] == bookID);
  bool isEdited = false;
  print('Enter new ${mode.name}:');
  String input = stdin.readLineSync()!;
  while (input != '0') {
    if (input.isEmpty) {
      print('Nothing Entered!\nPlease try again...');
      input = stdin.readLineSync()!;
      continue;
    }
    library[bookIndex][mode.name] = input;
    if (syncLibraryWithDB()) {
      print('Data Stored!');
    }
    isEdited = true;
    break;
  }
  return isEdited ? library[bookIndex] : null;
}

void deleteBookRequest() {
  int? id = getBookId();
  if (id != null) {
    printBookByID(id);
    print('Do you realy want to delete the Book?(y: yes, n: no)');
    String input = stdin.readLineSync()!;
    if (input == 'y') {
      deleteBook(id);
      print('Book Deleted Succesfuly');
    }
  }
}

void deleteBook(int bookID) {
  int bookIndex = library.indexWhere((item) => item['id'] == bookID);
  // library.removeAt(bookIndex);
  library[bookIndex]['is_deleted'] = true;
  if (syncLibraryWithDB()) {
    print('Data Stored!');
  }
}

void printBookByID(int bookID) {
  Map<String, dynamic> book = library.firstWhere((item) => item['id'] == bookID);
  print('Book found Succesfuly:');
  print(getBookPrintable(book));
  print('------------------------------------');
}

int? getBookId() {
  bool isEntered = false;
  int? id = null;
  print('Enter BookID wants to Edit: (Enter 0 for back)');
  String input = stdin.readLineSync()!;
  while (input != '0') {
    if (input.isEmpty) {
      print('Nothig Entered!!\nPlease try again:');
      input = stdin.readLineSync()!;
      continue;
    }
    id = int.tryParse(input);
    if (id == null) {
      print('Input is not in currect format!!\nPlease try again:');
      input = stdin.readLineSync()!;
      continue;
    }
    //if this inputed id not found!!
    if (!library.any((item) => item['id'] == id && !item.containsKey('is_deleted'))) {
      print('Inputed ID not found!\nPlease try again:');
      input = stdin.readLineSync()!;
      continue;
    }
    isEntered = true;
    break;
  }
  return isEntered ? id : null;
}

void searchBooksRequest() {
  print('Enter the Select: (Enter 0 for back)\n1: Search in Titles.\n2: Search in Authors.\n3: Search in Each of them.');
  String input = stdin.readLineSync()!;
  while (input != '0') {
    if (input != '1' && input != '2' && input != '3') {
      print('Input not currrect!!\nPlease try again...');
      input = stdin.readLineSync()!;
    }
    print('Enter for search:');
    String data = stdin.readLineSync()!;
    if (data != '0') {
      var results = search(
          data,
          input == '1'
              ? SearchMode.title
              : input == '2'
                  ? SearchMode.author
                  : SearchMode.both);
      print('${results.length} items found:\n');
      print(results.map((item) => getBookPrintable(item)).join('\n----------------------\n'));
    }
    break;
  }
}

enum SearchMode { title, author, both }

List<Map<String, dynamic>> search(String source, SearchMode mode) {
  List<Map<String, dynamic>> resualt = [];
  if (mode == SearchMode.title) {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && item['title'].toString().contains(source))));
  } else if (mode == SearchMode.author) {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && item['author'].toString().contains(source))));
  } else {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && (item['author'].toString().contains(source) || item['title'].toString().contains(source)))));
  }
  return resualt;
}

String getBookPrintable(Map<String, dynamic> book) => "id: ${book['id']}\ttitle: ${book['title']}\tauthor: ${book['author']}";
