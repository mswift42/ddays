import 'package:ddays/storageservice.dart';
import 'package:ddays/task.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'dart:convert';



void main() {
  Task t1 = new Task('task1');
  saveToStorage(t1);
  loadFromStorage();
  expect(tasklist[0].summary, 'task1');
}