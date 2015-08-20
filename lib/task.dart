library task;

import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:ddays/taskcategory.dart' show TaskCategory;

class TaskNote {
  String notebody;
  TaskNote(this.notebody);
}



class Task {
  String summary;
  List<TaskNote> tasknotes = [];
  DateTime scheduled;
  Uuid uuid;
  bool done;
  Set<TaskCategory> taskcategories = new Set();
  Task(this.summary, [this.scheduled=null]) {
    var uuid = new Uuid();
    this.uuid = uuid.v4();
    this.done = false;
  }
  Task.fromJson(json) {
    Map data = json;
    summary = data['summary'];
    uuid = data['uuid'];
    scheduled = data['scheduled'];
    done = data["done"];
  }

  void addNote(TaskNote note) {
    tasknotes.add(note);
  }
  
  void addCategory(TaskCategory cat ) {
    taskcategories.add(cat);
  }
  void removeCategory(TaskCategory cat) {
    taskcategories.remove(cat);
  }
}

