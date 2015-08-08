
import 'package:ddays/task.dart';
import "package:test/test.dart";


void main() {
  test('task gets initialised correctly', () {
    var t1 = new Task('task1');
    expect(t1.summary, 'task1');
    var t2 = new Task('task2', new DateTime(2015,1,1));
    expect(t2.scheduled.month, 1);
  });
  test('task.done is initialised to false', () {
    var t1 = new Task('task1');
    expect(t1.done, false);
  });
  test('the timestamp of a newer Task should be bigger than the older one',() {
    var t1 = new Task('task1');
    var t2 = new Task('task2');
    expect(t1.timestamp <= t2.timestamp, true);
  });
  test('addNote should add notes to tasknotes list.', () {
    var t1 = new Task('task1');
       var n1 = new TaskNote('first note');
       t1.addNote(n1);
       expect(t1.tasknotes[0].notebody, 'first note');
  });
  test('addCategory shoud add a category to taskcategories', () {
    var t1 = new Task('task1');
    t1.addCategory('work');
    expect(t1.taskcategories.contains('work'), true);
    t1.addCategory('travel');
    expect(t1.taskcategories.contains('travel'), true);
    expect(t1.taskcategories.length,2);
  });
  test('removeCategory should remove the correct category', () {
    var t1 = new Task('task1');
    ['work','travel', 'family', 'private'].forEach((i) => t1.addCategory(i));
    expect(t1.taskcategories.contains('private'), true);
    t1.removeCategory('family');
    expect(t1.taskcategories.contains('family'), false);
    expect(t1.taskcategories.contains('work'), true);
    t1.removeCategory('work');
    expect(t1.taskcategories.contains('work'), false);
    expect(t1.taskcategories.contains('private'), true);
    t1.removeCategory('private');
    expect(t1.taskcategories.contains('private'),false);
    expect(t1.taskcategories.contains('travel'), true);
    t1.removeCategory('travel');
    expect(t1.taskcategories.length,0);
  });
 
}
    