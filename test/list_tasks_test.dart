
import 'package:ddays/list_tasks.dart';
import 'package:test/test.dart';
import 'dart:html';

void main() {
  test('sinlgeTaskElement returns a LIElement with correct p children', () {
  LIElement st = singleTaskElement('task1');
  expect(st.children[0].text, 'task1');
  expect(st.classes.contains('singletask'),true);
  expect(st.children[0].classes.contains('summarytext'),true);
  LIElement st2 = singleTaskElement('');
  expect(st2.children[0].text, '');
  expect(st2.children[0].classes.contains('summarytext'),true);
  });
  test('insertTask should prepend a singleTaskElement into #listtasks children.',() {
    insertTask('some task');
    var li = querySelector('#listtasks').children[0];
    expect(li.children[0].text, 'some task');
    insertTask('other task');
    var li2 = querySelector('#listtasks').children[0];
    expect(li2.children[0].text, 'other task');
  });
  test('inserted tasks should be retrievable by their classname "singletask"', () {
    insertTask('more tasks');
    var retrieved = querySelector('.singletask');
    expect(retrieved.children[0].text, 'more tasks');
  });
  test('3 singleTaskElements should have been inserted', () {
    expect(querySelectorAll('.singletask').length,3);
  });
  test('editTaskElement returns a li element', () {
    var et = editTaskElement('t1');
    expect(et is LIElement, true);
  });
  
}
