import 'package:flutter/material.dart';
import 'package:rest_apis/GetApis/album_screen.dart';
import 'package:rest_apis/GetApis/comments_screen.dart';
import 'package:rest_apis/GetApis/product_screen.dart';
import 'package:rest_apis/GetApis/user_screen.dart';
import 'package:rest_apis/GetApis/user_without_model.dart';
import 'package:rest_apis/PostApis/login_screen.dart';
import 'package:rest_apis/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Apis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
