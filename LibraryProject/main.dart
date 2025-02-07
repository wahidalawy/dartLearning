import 'dart:io';
import 'databasesHandler.dart';
import 'requestHandler.dart';

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
