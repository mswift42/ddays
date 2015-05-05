library list_tasks;

import 'dart:html';
import 'package:ddays/storageservice.dart' show loadFromStorage;

LIElement singleTaskElement(String tasksummary) {
  LIElement li = new LIElement();
  ParagraphElement p = new ParagraphElement();
  p
    ..text = tasksummary
    ..classes.add('summarytext');
  li
    ..classes.add('singletask')
    ..append(p);
  return li;
}

LIElement editTaskElement(String tasksummary) {
  LIElement li = new LIElement();
  TextInputElement ti = new TextInputElement();
  ti
    ..value = tasksummary
    ..classes.add('summarytext');
  li
    ..classes.add('singletask')
    ..classes.add('hideedittask')
    ..append(ti);
  return li;
}

DivElement taskContainer(String tasksummary) {
  DivElement div = new DivElement();
  div
    ..classes.add('taskcontainer')
    ..append(singleTaskElement(tasksummary))
    ..append(editTaskElement(tasksummary));
  return div;
}

// append for each task in tasks a singletask
// element to div '#listtasks'.
void displayTasks() {
  DivElement div = querySelector('#listtasks');
  List tl = loadFromStorage();
  tl.forEach((i) {
    div.append(singleTaskElement(i['summary']));
    div.append(editTaskElement(i['summary']));
  });
}
// insert Task into displayed tasklist at index 0;
void insertTask(String tasksummary) {
  LIElement st = singleTaskElement(tasksummary);
  querySelector('#listtasks').children.insert(0, st);
}
