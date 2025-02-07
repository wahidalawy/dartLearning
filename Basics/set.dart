void main(List<String> args) {
  Set a = {1, 2, 3};
  Set b = {3, 4, 5};
  a.difference(b); // 1,2
  b.difference(a); // 4,5
  a.intersection(b); // 3
  a.union(b); // 1,2,3,4,5

  final characters = <String>{'A', 'B', 'C'};
  final containsB = characters.lookup('B');
  print(containsB); // B
  final containsD = characters.lookup('D');
  print(containsD); // null

  
}
