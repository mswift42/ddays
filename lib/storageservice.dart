library storageservice;

import 'dart:html';
import 'dart:convert';

final String STORAGE_KEY = 'ddays';

List tasklist = [];

// add an item to a given List, then save
// this list in localStorage with the key 'STORAGE_KEY'.
void saveToStorage(item) {
  tasklist.add(item);
  window.localStorage[STORAGE_KEY] = JSON.encode(tasklist);
}

// restore a to localstorage, under key 'STORAGE_KEY',
// saved List.
List loadFromStorage() {
  tasklist = window.localStorage.containsKey(STORAGE_KEY)
      ? JSON.decode(window.localStorage[STORAGE_KEY])
      : [];
  return tasklist;
}

// delete a item from local Storage object with key 'STORAGE_KEY'.
void deleteItemInStorage(item) {
  var storedlist =
      loadFromStorage().where((i) => i.timestamp == item.timestamp);
  window.localStorage[STORAGE_KEY] = JSON.encode(storedlist);
}

// delete localStorage key.
void deleteStorage() {
  window.localStorage.clear();
}
