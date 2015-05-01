
import 'package:ddays/storageservice.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'dart:convert';

void initStorage() {
  window.localStorage[STORAGE_KEY] = JSON.encode([]);
}
  

void main() {
  initStorage();
  var tasks = [];
  saveToStorage(tasks, {'summary':'task1'});
  var restored = loadFromStorage();
  expect(restored[0]['summary'], 'task1');
}