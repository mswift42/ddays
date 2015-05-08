
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
  Task(this.summary, [this.scheduled=null]) {
    this.timestamp = new DateTime.now().millisecondsSinceEpoch;
  }
  Task.fromJson(String json) {
    Map data = json.parse(json);
    var sched = data['scheduled'];
    summary = data['summary'];
    scheduled = (sched.trim() == '') ? null : new DateTime(sched);
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

