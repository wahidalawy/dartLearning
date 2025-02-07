import 'dart:collection';

void main(List<String> args) {
  Queue q = Queue.from([1, 2, 3, 4, 5]);
  q.addFirst(0);
  q.addLast(6);
  q.removeFirst();
  q.removeLast();
  print(q);

  //first in first out => fi fo
  q.addFirst('value');
  q.removeFirst();
  //last in last out => li lo
  q.addLast('value');
  q.removeLast();
  //first in last out => fi lo
  q.addFirst('value');
  q.removeLast();
  //last in first out  => li fo
  q.addLast('value');
  q.removeFirst();
}
