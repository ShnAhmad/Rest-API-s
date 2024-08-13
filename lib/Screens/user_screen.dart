import 'dart:convert';
import 'package:rest_apis/components/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:rest_apis/Models/user_model.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> users = [];

  Future<List<UserModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        // print(i);
        users.add(UserModel.fromJson(i));
      }
      return users;
    } else {
      return users;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUsersApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 223, 176, 207),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'Name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusableRow(
                                      title: 'Email',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusableRow(
                                      title: 'Adresss',
                                      value: snapshot.data![index].address!.city
                                              .toString() +
                                          snapshot
                                              .data![index].address!.geo!.lng
                                              .toString()),
                                  ReusableRow(
                                      title: 'company',
                                      value: snapshot.data![index].company!.name
                                          .toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
