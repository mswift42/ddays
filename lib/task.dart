library task;

import 'dart:convert';

class TaskNote {
  String notebody;
  TaskNote(this.notebody);
}



class Task {
  String summary;
  List<TaskNote> tasknotes = [];
  DateTime scheduled;
  int timestamp;
  Set<String> taskcategories = new Set();
  Task(this.summary, [this.scheduled=null]) {
    this.timestamp = new DateTime.now().millisecondsSinceEpoch;
  }
  Task.fromJson(json) {
    Map data = json;
    var sched = data['scheduled'];
    summary = data['summary'];
    timestamp = data['timestamp'];
    scheduled = data['scheduled'];
  }

  void addNote(TaskNote note) {
    tasknotes.add(note);
  }
  
  void addCategory(String cat ) {
    taskcategories.add(cat);
  }
  void removeCategory(String cat) {
    taskcategories.remove(cat);
  }
}

