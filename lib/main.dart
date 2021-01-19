import 'package:flutter/material.dart';
import 'package:fluttering/pages/ChooseTicker.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/ChooseTicker.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/ticker': (context) => ChooseTicker(),
  },
));

