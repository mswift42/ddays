import 'package:ddays/storageservice.dart';
import 'package:ddays/task.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'dart:convert';

void main() {
  test('tasks get saved to local Storage', () {
    Task t1 = new Task('task1');
    saveToStorage(t1);
    loadFromStorage();
    expect(tasklist[0].summary, 'task1');
  });
  test('deleteStorage clears local Storage', () {
    deleteStorage();
    expect(window.localStorage[STORAGE_KEY], null);
    Task t1 = new Task('task1');
    serializeAndSave([t1]);
    expect(window.localStorage.containsKey(STORAGE_KEY), true);
    deleteStorage();
    expect(window.localStorage[STORAGE_KEY], null);
  });
  test('tasks get serialised and saved', () {
    Task t1 = new Task('task1');
    serializeAndSave([t1]);
    loadFromStorage();
    expect(tasklist[0].summary, 'task1');
  });
  test('serializeAndSave saves all tasks', () {
    Task t1 = new Task('task1');
    Task t2 = new Task('task2');
    serializeAndSave([t1,t2]);
    loadFromStorage();
    expect(tasklist.length, 2);

  });
}
