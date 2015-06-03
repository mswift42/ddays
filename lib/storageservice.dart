library storageservice;

import 'dart:html';
import 'dart:convert';
import 'package:ddays/task.dart' show Task, fromJson;

final String STORAGE_KEY = 'ddays';

List<Task> tasklist = [];

void serializeAndSave(List<Task> tasks) {
  List tasklist = [];
  tasks.forEach((i) {
    tasklist.add({
      "summary": i.summary,
      "timestamp": i.timestamp,
      "scheduled": i.scheduled
    });
  });
  window.localStorage[STORAGE_KEY] = JSON.encode(tasklist);
}

// add an item to a given List, then save
// this list in localStorage with the key 'STORAGE_KEY'.
void saveToStorage(item) {
  tasklist.add(item);
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
  var storedlist = tasklist.where((i) => i.timestamp != item.timestamp);
  tasklist = storedlist;
  serializeAndSave(tasklist);
}

// edit an item in local Storage object 'STORAGE_KEY'.
void editItemInStorage(Task task) {
  tasklist.forEach((i) {
    if (i.timestamp == task.timestamp) {
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
