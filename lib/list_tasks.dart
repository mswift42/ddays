
library list_tasks;

import 'dart:html';
import 'package:ddays/task.dart' show Task;
import 'package:ddays/storageservice.dart' as st;

// singleTaskElement returns a List Element that has
//  a paragraphelement as a child node. The text of
// the paragraphelement is set to the parameter 'tasksummary'.
LIElement singleTaskElement(Task task) {
  LIElement li = new LIElement();
  ParagraphElement p = new ParagraphElement();
  p
    ..text = task.summary
    ..classes.add('summarytext');
  li
    ..classes.add('singletask')
    ..onClick
        .listen((e) {
    li.parent.children[1].classes.toggle('hideedittask');
    li.classes.toggle('hidesingletask');
  })
    ..append(p);
  return li;
}

// editTaskElement returns a List Element that as an
// TextInput Element as a child node. The value of
//  the textinput element is set to the given parameter tasksummary.
LIElement editTaskElement(Task task) {
  LIElement li = new LIElement();
  TextInputElement ti = new TextInputElement();
  FormElement fe = new FormElement();
  ti
    ..value = task.summary
    ..classes.add('summarytext');
  fe
    ..onSubmit
    .listen((e) {
          st.editItemInStorage(ti.value);
          li.parent.children[0].classes.toggle('hidesingletask');
          li.classes.toggle('hideedittask');
        })
    ..append(ti);
  li
    ..classes.add('singletask')
    ..classes.add('hideedittask')
    ..append(fe);
  return li;
}

// taskContainer returns a Div Element with the
// child nodes of singleTaskElement and editTaskElement.
DivElement taskContainer(Task task) {
  DivElement div = new DivElement();
  div
    ..classes.add('taskcontainer')
    ..append(singleTaskElement(task))
    ..append(editTaskElement(task));

  return div;
}

// append for each task in tasks a taskContainer
// element to div '#listtasks'.
void displayTasks() {
  DivElement div = querySelector('#listtasks');
  List tl = st.loadFromStorage();
  tl.forEach((i) => div.append(taskContainer(i['summary'])));
}

// insert Task into displayed tasklist at index 0;
void insertTask(String tasksummary) {
  DivElement div = taskContainer(tasksummary);
  querySelector('#listtasks').children.insert(0, div);
}
