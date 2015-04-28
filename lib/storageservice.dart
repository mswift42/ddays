library storageservice;

import 'dart:html';
import 'dart:convert';


void saveToStorage(storedlist, item, name) {
  storedlist.add(item);
  window.localStorage[name] = JSON.encode(item);
}

