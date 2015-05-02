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

void displayTasks() {
  List tasks = loadFromStorage();
  DivElement div = querySelector('#listtasks');
  tasks.forEach((i) => div.append(singletask(i['summary'])));
  
  
}