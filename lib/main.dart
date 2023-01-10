import 'package:flutter/material.dart';
import 'package:urbanmatch/commitScreen.dart';
import 'package:urbanmatch/getRepo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Repo',
      home: GetRepo(),
    );
  }
}
