import 'package:ddays/list_tasks.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'package:ddays/task.dart' show Task;

void main() {
  test('singleTaskElement returns a LIElement', () {
    var t1 = new Task('t0');
    var li = singleTaskElement(t1);
    expect(li is LIElement, true);
  });
  test('sinlgeTaskElement returns a LIElement with correct p children', () {
    var t1 = new Task('task1');
    LIElement st = singleTaskElement(t1);
    expect(st.children[0].text, 'task1');
    expect(st.classes.contains('singletask'), true);
    expect(st.children[0].classes.contains('summarytext'), true);
    var t2 = new Task('');
    LIElement st2 = singleTaskElement(t2);
    expect(st2.children[0].text, '');
    expect(st2.children[0].classes.contains('summarytext'), true);
  });
  test(
      'insertTask should prepend a singleTaskElement into #listtasks children.',
      () {
    var t1 = new Task('some task');
    insertTask(t1);
    var li = querySelector('#listtasks').children[0];
    expect(li.children[0].text, 'some task');
    var t2 = new Task('other task');
    insertTask(t2);
    var li2 = querySelector('#listtasks').children[0];
    expect(li2.children[0].text, 'other task');
  });
  test('inserted tasks should be retrievable by their classname "singletask"',
      () {
    var t1 = new Task('more tasks');
    insertTask(t1);
    var retrieved = querySelector('.singletask');
    expect(retrieved.children[0].text, 'more tasks');
  });
  test('editTaskElement returns a li element', () {
    var t1 = new Task('t1');
    var et = editTaskElement(t1);
    expect(et is LIElement, true);
  });
  test('editTaskElement returns a LIElement with an textinput children.', () {
    var t1 = new Task('t1');
    var et = editTaskElement(t1);
    expect(et.classes.contains('singletask'), true);
    expect(et.classes.contains('hideedittask'), true);
    expect(et.children[0].children[0].value, 't1');
    expect(et.children[0].children[0].classes.contains('summarytext'), true);
  });
  test('taskCategory returns a Div Element', () {
    var tc1 = taskCategory('work', '#221122');
    expect(tc1 is DivElement, true);
  });
  test('taskCategory returns a Div Element with a Para. Element children.', () {
    var tc1 = taskCategory('work', '#221122');
    expect(tc1.childNodes[0] is ParagraphElement, true);
  });
  test('taskCategory adds a class categorycontainer', () {
    var tc1 = taskCategory('work', '#221122');
    expect(tc1.classes.contains('categorycontainer'),true);
    var tc2 = taskCategory('', '');
    expect(tc2.classes.contains('categorycontainer'), true);
  });
}
