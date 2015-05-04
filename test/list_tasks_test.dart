
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
  
}
