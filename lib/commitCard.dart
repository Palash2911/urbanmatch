import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urbanmatch/commitScreen.dart';

class CommitCard extends StatelessWidget {
  final commitmssg;
  final committer;
  final dt;

  CommitCard({
    required this.commitmssg,
    required this.committer,
    required this.dt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(23.0),
            child: FittedBox(
              child: Text(
                committer,
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
              "Commit Date: "+DateFormat.yMMMd().format(DateTime.parse(dt)).toString(),
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
              commitmssg,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
