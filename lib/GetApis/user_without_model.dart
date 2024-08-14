import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis/components/reuseable_row.dart';

class UserWithoutModel extends StatefulWidget {
  const UserWithoutModel({super.key});

  @override
  State<UserWithoutModel> createState() => _UserWithoutModelState();
}

class _UserWithoutModelState extends State<UserWithoutModel> {
  var data;
  Future<void> getDirectUsersApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Without Model class'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getDirectUsersApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 222, 223, 176),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'Name',
                                      value: data[index]['name'].toString()),
                                  ReusableRow(
                                      title: 'Email',
                                      value: data[index]['email'].toString()),
                                  ReusableRow(
                                      title: 'Address',
                                      value: data[index]['address']['city']
                                              .toString() +
                                          data[index]['address']['geo']['lng']
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
