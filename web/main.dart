// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:ddays/nav_menu.dart';
import 'package:route_hierarchical/client.dart';
import 'package:ddays/list_tasks.dart' show singletask, displayTasks;
import 'package:ddays/new_task.dart' show saveTaskHandler;


void main() {
  initNavMenu();

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
    ..addRoute(name: 'about', path: '/about', enter: showAbout)
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);
  router.listen();
  displayTasks();
  saveTask();
  
}

void showAbout(RouteEvent e) {
  // Extremely simple and non-scalable way to show different views.
  querySelector('#home').style.display = 'none';
  querySelector('#about').style.display = '';
}

void showHome(RouteEvent e) {
  querySelector('#home').style.display = '';
  querySelector('#about').style.display = 'none';
}
void saveTask() {
  querySelector('#tform').onSubmit.listen((Event e) =>
      saveTaskHandler(e));
}