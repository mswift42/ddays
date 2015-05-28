import 'package:ddays/storageservice.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'dart:convert';



void main() {
  saveToStorage({'summary':'task1'});
  var restored = loadFromStorage();
  expect(restored[0].summary, 'task1');
}