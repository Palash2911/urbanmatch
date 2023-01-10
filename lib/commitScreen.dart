import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urbanmatch/commitCard.dart';

import 'models/Commits.dart';
import 'package:urbanmatch/utils/Api.dart';

import 'package:http/http.dart' as http;

class CommitScreen extends StatefulWidget {
  final repoName;
  CommitScreen(this.repoName);
  @override
  State<CommitScreen> createState() => _CommitScreenState();
}

class _CommitScreenState extends State<CommitScreen> {
  List<Commits> _commits = [];
  Future<void> getCommitInfo() async {
    final api = "${Api.apiCommit}/${widget.repoName}/commits";
    print(api);
    try {
      List<Commits> tempList = [];
      var res = await http.get(Uri.parse(api));
      final resData = jsonDecode(res.body) as List<dynamic>;
      for (int i = 0; i < resData.length; i++) {
        Commits cmt = Commits(
          dt: resData[i]["commit"]["author"]["date"].toString(),
          mssg: resData[i]["commit"]["message"].toString(),
          committer: resData[i]["commit"]["author"]["name"].toString(),
        );
        tempList.add(cmt);
      }
      print(resData.length);
      setState(() {
        _commits=tempList;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCommitInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commits'),
      ),
      body: Container(
        height: 450,
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _commits.length,
          itemBuilder: (ctx, index) => CommitCard(
            committer: _commits[index].committer,
            commitmssg: _commits[index].mssg,
            dt: _commits[index].dt,
          ),
        ),
      ),
    );
  }
}
