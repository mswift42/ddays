
import 'package:ddays/task.dart';
import "package:test/test.dart";


void main() {
  test('task gets initialised correctly', () {
    var t1 = new Task('task1',null);
    expect(t1.summary, 'task1');
    var t2 = new Task('task2', new DateTime(2015,1,1));
    expect(t2.scheduled.month, 1);
  });
  test('addNote should add notes to tasknotes list.', () {
    var t1 = new Task('task1', null);
       var n1 = new TaskNote('first note');
       t1.addNote(n1);
       expect(t1.tasknotes[0].notebody, 'first note');
  });
 
}
    