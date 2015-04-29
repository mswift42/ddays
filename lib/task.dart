
library task;

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
  Task(this.summary, this.scheduled) {
    this.timestamp = new DateTime.now().millisecondsSinceEpoch;
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

