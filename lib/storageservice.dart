library storageservice;

import 'dart:html';
import 'dart:convert';

final String STORAGE_KEY = 'ddays';

// add an item to a given List, then save
// this list in localStorage with the key 'STORAGE_KEY'.
void saveToStorage(storedlist, item) {
  storedlist.add(item);
  window.localStorage[STORAGE_KEY] = JSON.encode(item);
}

// restore a to localstorage, under key 'STORAGE_KEY',
// saved List.
List loadFromStorage() {
  return JSON.decode(window.localStorage[STORAGE_KEY]);
}

// delete a local Storage object with key 'STORAGE_KEY'.
void deleteItemInStorage(storedlist, item) {
}

