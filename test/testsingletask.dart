
import 'package:ddays/task.dart';
import "package:test/test.dart";


void main() {
  test('task gets initialised correctly', () {
    var t1 = new Task('task1',null, '');
    expect(t1.summary, 'task1');
    var t2 = new Task('task2', new DateTime(2015,1,1), 'work');
    expect(t2.scheduled.month, 1);
    expect(t2.status, 'work');
  });
 
}
    