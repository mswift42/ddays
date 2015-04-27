
library singletask;

class Task {
  String summary;
  List<String> tasknotes = [];
  DateTime scheduled;
  Task(this.summary);
}