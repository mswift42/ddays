library list_tasks;

import 'dart:html';

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