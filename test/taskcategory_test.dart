import 'package:test/test.dart';
import 'package:ddays/taskcategory.dart';


void main() {
  test('initialization of taskcategory objects works', () {
    TaskCategory tc1 = new TaskCategory('work', '#2c4504');
    expect(tc1.name, 'work');
    expect(tc1.background, '#2c4504');
  });
}
