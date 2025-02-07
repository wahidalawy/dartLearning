import 'databasesHandler.dart';
import 'enums.dart';
import 'typedefs.dart';

List<Book> library = [];

void showAllBooks() {
  print(
    library.where((item) => !item.containsKey('is_deleted')).map((item) => getBookPrintable(item)).toList().join('\n----------------------\n'),
  );
}

Book addBook(String title, String author) {
  int id = library.isNotEmpty ? library.last['id'] + 1 : 1;
  Book addedBook = {'id': id, 'title': title, 'author': author};
  library.add(addedBook);
  if (syncLibraryWithDB()) {
    print('Data Stored!');
  }
  return addedBook;
}

Book editBook(int bookID, EditMode mode, String source) {
  int bookIndex = library.indexWhere((item) => item['id'] == bookID);
  library[bookIndex][mode.name] = source;
  if (syncLibraryWithDB()) {
    print('Data Stored!');
  }
  return library[bookIndex];
}

void deleteBook(int bookID) {
  int bookIndex = library.indexWhere((item) => item['id'] == bookID);
  library[bookIndex]['is_deleted'] = true;
  if (syncLibraryWithDB()) {
    print('Data Stored!');
  }
}

void printBookByID(int bookID) {
  Book book = library.firstWhere((item) => item['id'] == bookID);
  print('Book found Succesfuly:');
  print(getBookPrintable(book));
  print('------------------------------------');
}

List<Book> search(String source, SearchMode mode) {
  List<Book> resualt = [];
  if (mode == SearchMode.title) {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && item['title'].toString().contains(source))));
  } else if (mode == SearchMode.author) {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && item['author'].toString().contains(source))));
  } else {
    resualt.addAll(library.where((item) => (!item.containsKey('is_deleted') && (item['author'].toString().contains(source) || item['title'].toString().contains(source)))));
  }
  return resualt;
}

String getBookPrintable(Book book) => "id: ${book['id']}\ttitle: ${book['title']}\tauthor: ${book['author']}";
