import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urbanmatch/commitScreen.dart';

class RepoCard extends StatelessWidget {
  final repoName;
  String codedOn = "";
  final lastPush;
  final forks;

  RepoCard({
    required this.repoName,
    required this.codedOn,
    required this.lastPush,
    required this.forks,
  });

  void _changeScreen(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => CommitScreen(
          repoName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () => _changeScreen(context),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(27.0),
              child: FittedBox(
                child: Text(
                  repoName,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Created on: " +
                    DateFormat.yMMMd()
                        .format(DateTime.parse(codedOn))
                        .toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Last Pushed: " +
                    DateFormat.yMMMd()
                        .format(DateTime.parse(lastPush))
                        .toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Forks: " + forks,
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
