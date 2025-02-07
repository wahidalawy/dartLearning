import 'dart:convert';
import 'dart:io';

import 'bookHandler.dart';

String bookDBAddress = 'books.json';

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

bool syncLibraryWithDB() {
  try {
    String booksJson = jsonEncode(library);
    File(bookDBAddress).writeAsStringSync(booksJson);
    return true;
  } catch (ex) {
    return false;
  }
}
