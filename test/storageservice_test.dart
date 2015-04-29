
import 'package:ddays/storageservice.dart';
import 'package:test/test.dart';
import 'dart:html';
import 'dart:convert';

void initStorage() {
  window.localStorage[STORAGE_KEY] = JSON.encode([]);
}
  

void main() {
  test('