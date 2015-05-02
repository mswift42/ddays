library list_tasks;

import 'dart:html';
import 'package:ddays/storageservice.dart' show loadFromStorage;


LIElement singletask(String tasksummary) {
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

// append for each task in tasks a singletask
// element to div '#listtasks'.
void displayTasks() {
  DivElement div = querySelector('#listtasks');
  List tasklist = loadFromStorage();
  tasklist.forEach((i) => div.append(singletask(i['summary'])));
    
}