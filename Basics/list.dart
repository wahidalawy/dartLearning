void main(List<String> args) {
  List<String?> items = ["1", "2", "3", null, "4", "5"];

  // items = List.empty(growable: false);

  // items = List.generate(
  //   10,
  //   (index) => Random().nextInt(1000).toString(),
  // );

  // items = List.filled(10, "", growable: false);
  // items[0] = "salam";

  // items = List.from(["1", "2"], growable: false);

  //List<String> foo = new List.from(<int>[1, 2, 3]); // okay until runtime.
  //List<String> bar = new List.of(<int>[1, 2, 3]); // analysis error

  //var foo1 = new List.from(<int>[1, 2, 3]); // List<dynamic>
  //var bar1 = new List.of(<int>[1, 2, 3]); // List<int>
  // print(foo);

  //print(items.first);
  //print(items.last);
  //print(items.reversed);
  //print(items.firstOrNull);
  //print(items.lastOrNull);
  //print(items.singleOrNull);
  //print(items.indexed);
  //print(items.nonNulls.indexed);

  ///C => create R => read U => update D => delete

  ///C
  //items.add('value');
  //items.addAll(['value']);
  //items.insert(5, 'element');
  //items.insertAll(5, ['element',]);

  ///R
  ///read value
  //items[1];
  //items.elementAt(1);
  //items.elementAtOrNull(20);
  //["1", "2", "3", "4", "5"].skip(2).take(3);
  //[1, 2, 3, 4, 5].skipWhile((value) => value < 3).takeWhile((value) => value < 6);
  // [1, 2, 3, 4, 5].getRange(1, 3);

  ///read index form value
  //["a", "b", "a", "c", "a", "d"].indexOf("a", 1); // 2
  //["a", "b", "a", "c", "a", "d"].lastIndexOf("a", 1); // 4

  ///U
  items[2] = "";
  [1, 2, 3, 4, 5].replaceRange(2, 4, [5, 6, 7, 8]);
  // print([1, 2, 3, 4, 5].expand((element) {
  //   List<int> expanded = List.empty(growable: true);
  //   for (var i = 1; i <= element; i++) {
  //     expanded.add(i);
  //   }
  //   return expanded;
  // }));
  // [1, 2, 3, 4, 5].shuffle();
  // items = List.filled(5, "a");
  // items.fillRange(0, 5, "SALAM");
  // print(items);
  // print([1, 2, 3, 4, 5].fold(0, (previousValue, element) => (previousValue as int) + element));
  // print(['s', 'a', 'l', 'a', 'm'].join());
  // print(['s', 'a', 'l', 'a', 'm'].fold("", (previousValue, element) => previousValue.toString() + element));
  // var list2 = [1, 2, 3].followedBy([4, 5, 6]);
  // print([1, 2, 3].map((item) => item * item));

  //print(['s', 'a', 'l', 'a', 'm'].fold("", (previousValue, element) => previousValue.toString() + element));
  //print(['s', 'a', 'l', 'a', 'm'].reduce((previousValue, element) => previousValue.toString() + element));

  // ['a', 'b', 'c', 'd'].setAll(1, ['bee', 'sea']); // ['a','bee','sea','d']

  //final list1 = <int>[1, 2, 3, 4];
  //final list2 = <int>[5, 6, 7, 8, 9];
  //const skipCount = 3;
  //list1.setRange(1, 3, list2, skipCount);
  //print(list1); // [1, 8, 9, 4]

  // [1, 2, 3, 4, 5].sublist(2, 4); // [3, 4]

  // items = ['aaaa', 'bb', 'd', 'ccc', 'fffff', 'eeeee'];
  // items.sort();
  // items.sort((a, b) {
  //   if (a!.length.compareTo(b!.length) == 0) {
  //     return a.compareTo(b);
  //   }
  //   return a.length.compareTo(b.length);
  //   if (a!.length < b!.length) {
  //     return -1;
  //   } else if (a!.length == b!.length) {
  //     return 0;
  //   } else {
  //     return 1;
  //   }
  // });
  // print(items);

  ///D
  //['value', 'value', 'value'].remove('value'); // ['value', 'value']
  //['a', 'b', 'c'].removeAt(1); // ['a', 'c']
  //['a', 'b', 'c'].removeLast(); // ['a', 'b']
  //['a', 'b', 'c'].removeRange(1, 2); // ['a', 'c']
  //var items2 = List.generate(10, (index) => index);
  //items2.removeWhere((element) => element.isEven); // [1, 3]
  //print(items2);
  //final numbers = <String>['one', 'two', 'three', 'four'];
  //numbers.retainWhere((item) => item.length == 3);
  //print(numbers); // ['one', 'two']

  ///Search
  //var items3 = [];
  /// search value => value
  //[1, 2, 3, 4, 5].where((element) => element.isEven);
  //['1', true, 12].whereType<bool>();
  //['s', '*', 's', '*'].firstWhere((element) => element == '*');
  //['s', '*', 's', '*'].lastWhere((element) => element == '*');
  //['1', '1', '2'].singleWhere((element) => element == '1', orElse: () => 'not found');
  /// search value => index
  //[1, 2, 3, 4, 5].indexWhere((element) => element.isEven); //1
  //[1, 2, 3, 4, 5].lastIndexWhere((element) => element.isEven); //3
  /// search and check
  //final numbers = <int>[1, 2, 3, 5, 6, 7];
  //var result = numbers.any((element) => element >= 5); // true;
  //result = numbers.any((element) => element >= 10); // false;

  //['salam', 'sdf', 'sfrg'].contains('salam'); //true

  //[1, 3, 5, 7].every((element) => element.isOdd); // true
  //[1, 3, 5, 8].every((element) => element.isOdd); // false
}
