library storageservice;

import 'dart:html';
import 'dart:convert';
import 'package:ddays/task.dart' show Task, fromJson;

final String STORAGE_KEY = 'ddays';

List<Task> tasklist = [];

void serializeAndSave(List<Task> tasks) {
  List resultlist = [];
  tasks.forEach((i) {
    resultlist.add({
      "summary": i.summary,
      "uuid": i.uuid,
      "scheduled": i.scheduled
    });
  });
  window.localStorage[STORAGE_KEY] = JSON.encode(resultlist);
}

// add task to tasklist, then save
// this list in localStorage with the key 'STORAGE_KEY'.
void saveToStorage(Task task) {
  tasklist.add(task);
  serializeAndSave(tasklist);
}

// restore a to localstorage, under key 'STORAGE_KEY',
// saved List.
void loadFromStorage() {
  if (window.localStorage.containsKey(STORAGE_KEY)) {
    List<Task> tasks = [];
    List stored = JSON.decode(window.localStorage[STORAGE_KEY]);
    stored.forEach((i) {
      var t = new Task.fromJson(i);
      tasks.add(t);
    });
    tasklist = tasks;
  }
}

// delete a item from local Storage object with key 'STORAGE_KEY'.
void deleteItemInStorage(item) {
  List<Task> storedlist = tasklist.where((i) => i.uuid != item.uuid).toList();
  tasklist = storedlist;
  serializeAndSave(tasklist);
}

// edit an item in local Storage object 'STORAGE_KEY'.
void editItemInStorage(Task task) {
  tasklist.forEach((i) {
    if (i.uuid == task.uuid) {
      i.summary = task.summary;
      i.scheduled = task.scheduled;
    }
  });
  serializeAndSave(tasklist);
}
// delete localStorage key.
void deleteStorage() {
  window.localStorage.clear();
}
