
library task;



class Task {
  String summary;
  List<String> tasknotes = [];
  DateTime scheduled;
  String status;
  Task(this.summary, this.scheduled, this.status);

  void addNote(String note) {
    tasknotes.add(note);
  }
}

