library list_tasks;

import 'dart:html';
import 'package:ddays/task.dart' show Task, fromJson;
import 'package:ddays/storageservice.dart' as st;


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
    ..onClick.listen((e) {
      li.classes.toggle('hidesingletask');
      li.parent.children[1].classes.toggle('hideedittask');
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
  ButtonElement button = new ButtonElement();
  ti
    ..value = task.summary
    ..classes.addAll(['editinputform', 'summarytext'])
    ..addEventListener('blur', (e) {
      li.classes.toggle('hideedittask');
      li.parent.children[0].classes.toggle('hidesingletask');
    })
    ..onKeyUp((KeyboardEvent e) {
      if (e.keyCode == KeyCode.ENTER) {
        st.editItemInStorage(task);
        li.parent.children[0].classes.toggle('hidesingletask');
        li.classes.toggle('hidesingletask');
        li.parent.children[0].children[0].text= ti.value;
      }
  });
  fe
    ..onSubmit.listen((e) {
      e.preventDefault();
      task.summary = ti.value;
      st.editItemInStorage(task);
      li.parent.children[0].classes.toggle('hidesingletask');
      li.classes.toggle('hideedittask');
      li.parent.children[0].children[0].text = ti.value;
    })
    ..append(ti);
  button
    ..onClick.listen((e) {
      st.deleteItemInStorage(task);
      li.parent.remove();
    })
    ..text = "Delete";
  li
    ..classes.add('singletask')
    ..classes.add('hideedittask')
    ..append(button)
    ..append(ti);
  return li;
}
// deleteButton - DivElement containing a
// close icon and a button with text 'Delele'
DivElement deleteButton() {
  DivElement div = new DivElement();
  HtmlElement icon = new Element.html('<i class="icon icon-close"></i>');
  ButtonElement button = new ButtonElement();
  button
    ..classes.add('deletebutton')
    ..text = ('Delete');
  div
    ..classes.add('delebuttonelement')
    ..append(icon)
    ..append(button);
  return div;
}
// append for each task in tasks a taskContainer
// element to div '#listtasks'.
void displayTasks() {
  st.loadFromStorage();
  DivElement div = querySelector('#listtasks');
  List<Task> tl = st.tasklist;
  tl.forEach((i) {
    div.append(taskContainer(i));
  });
}

// insert Task into displayed tasklist at index 0;
void insertTask(Task task) {
  DivElement div = taskContainer(task);
  querySelector('#listtasks').children.insert(0, div);
}

DivElement taskCategory(String category, String background) {
  DivElement div = new DivElement();
  ParagraphElement p = new ParagraphElement();
  p.text = category;
  div
    ..append(p)
    ..classes.add('categorycontainer')
    ..style.background = background;
  return div;
}
