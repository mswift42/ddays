library new_task;

import 'dart:html';
import 'package:ddays/task.dart' show Task;
import 'package:ddays/storageservice.dart' show saveToStorage, STORAGE_KEY;

void saveTask(Event e) {
  e.preventDefault();
  InputElement summary = querySelector('[name="tsummary"]');
  Task task = new Task(summary.value.trim());
  
  
}