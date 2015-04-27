
import 'package:ddays/task.dart';
import "package:test/test.dart";


void main() {
  test('task gets initialised correctly', () {
    var t1 = new Task('task1',null, '');
    expect(t1.summary, 'task1');
  });
}
    