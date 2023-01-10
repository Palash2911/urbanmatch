import 'package:flutter/material.dart';
import 'package:urbanmatch/repoCard.dart';
import 'dart:convert';

import '../Models/repoModel.dart';
import '../utils/Api.dart';

import 'package:http/http.dart' as http;
import 'package:card_swiper/card_swiper.dart';

class GetRepo extends StatefulWidget {
  @override
  State<GetRepo> createState() => _GetRepoState();
}

class _GetRepoState extends State<GetRepo> {
  List<Repositories> _repo = [];
  var loading = true;

  Future<void> getRepoList() async {
    const api = Api.apiRepo;
    try {
      var res = await http.get(Uri.parse(api));
      List<Repositories> tempList = [];
      final resData = jsonDecode(res.body) as List<dynamic>;
      for (int i = 0; i < resData.length; i++) {
        Repositories repo = Repositories(
          userid: "freeCodeCamp",
          reponame: resData[i]["name"].toString(),
          last_pushed: resData[i]["pushed_at"].toString(),
          created: resData[i]["created_at"].toString(),
          forks: resData[i]["forks"].toString(),
        );
        tempList.add(repo);
      }

      setState(() {
        _repo = tempList;
        loading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getRepoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Repositories"),
      ),
      body: SafeArea(
        child: !loading
            ? Container(
            margin: EdgeInsets.symmetric(vertical: 120, horizontal: 160),
            child: CircularProgressIndicator(),
        )
            : Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        "User Name: freeCodeCamp",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 450,
                    margin:
                        EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _repo.length,
                      itemBuilder: (ctx, index) => RepoCard(
                        repoName: _repo[index].reponame,
                        codedOn: _repo[index].created,
                        lastPush: _repo[index].last_pushed,
                        forks: _repo[index].forks,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
