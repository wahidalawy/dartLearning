void main(List<String> args) {
  String example1 = "☝";
  String example3 = "+98 937-178-7445";

  print(example1.codeUnits.first);
  // runs
  for (var element in example3.runes) {
    print(String.fromCharCode(element) + "\n");
  }

  // allMatches with RegExp
  RegExp r = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$');
  for (var element in r.allMatches(example3)) {
    print(element[0]!);
  }

  print(example3.codeUnitAt(2));
  print(example3.codeUnits[2]);

  //  "A" - "B"
  print("A".compareTo("B")); // -1
  print("B".compareTo("A")); // 1
  print("A".compareTo("A")); // 0

  print("mahdi".contains("a", 2));

  print("mahdavi".indexOf("a"));
  print("mahdavi".lastIndexOf("a"));

  print("D".padLeft(10, "s"));
  print("D".padRight(10, "s"));
  print("D".padLeft(10));

  print("* khosh * amadi.".replaceFirst("*", "reza", 8));

  //  "2x + 5 = 10" => "(2 * 2.5)"
  print("2x + 5 = 10".replaceFirstMapped("2x", (found) {
    if (found[0]! == "2x") {
      return "(2 * 2.5)";
    } else {
      return "(3 * 2.5)";
    }
  }));

  print("#" + "salam reza khobi?".replaceAll(" ", "_"));
  print("#" + "salam reza khobi?".replaceAllMapped(" ", (found) => "/"));

  print("fsdf f sdf fsd sewf".replaceRange(0, 5, "ab"));

  print("salam salam salamati".split(" ").toSet());

  print('Eats shoots leaves'.splitMapJoin('shoots',
      onMatch: (m) => '${m[0]}', // (or no onMatch at all)
      onNonMatch: (n) => '*'));

  String ex = "mohammad*reza*+989371787445";
  print(ex.substring(ex.indexOf('*') + 1, ex.lastIndexOf('*')));
}
