import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis/Models/comments_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentsModel> commentsList = [];

  Future<List<CommentsModel>> getCommentsApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      commentsList.clear();
      for (Map<String, dynamic> i in data) {
        commentsList.add(CommentsModel.fromJson(i));
      }
      return commentsList;
    } else {
      return commentsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Apis'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getCommentsApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading');
                } else {
                  return ListView.builder(
                      itemCount: commentsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email\n${commentsList[index].email}'),
                          ],
                        ));
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
