library new_task;

import 'dart:html';
import 'package:ddays/task.dart' show Task;
import 'package:ddays/storageservice.dart' show saveToStorage, tasks;
import 'package:ddays/list_tasks.dart' show displayTasks;


void saveTaskHandler(Event e) {
  e.preventDefault();
  print(e);
  InputElement summary = querySelector('[name="tsummary"]');
  Task task = new Task(summary.value.trim());
  saveToStorage({"summary": task.summary,
    "scheduled" : task.scheduled, "timestamp" : task.timestamp});
  summary.value = '';
  displayTasks();
  
  
}