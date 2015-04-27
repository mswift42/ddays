
library task;

class TaskNote {
  String notebody;
  TaskNote(this.notebody);
}



class Task {
  String summary;
  List<TaskNote> tasknotes = [];
  DateTime scheduled;
  List<String> status = [];
  Task(this.summary, this.scheduled);

  void addNote(TaskNote note) {
    tasknotes.add(note);
  }
}

