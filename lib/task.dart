
library task;

class TaskNote {
  String notebody;
  TaskNote(this.notebody);
}



class Task {
  String summary;
  List<TaskNote> tasknotes = [];
  DateTime scheduled;
  List<String> taskcategories = [];
  Task(this.summary, this.scheduled);

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

