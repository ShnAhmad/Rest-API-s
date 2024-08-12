import 'package:flutter/material.dart';
import 'package:rest_apis/Screens/album_screen.dart';
import 'package:rest_apis/Screens/comments_screen.dart';
import 'package:rest_apis/Screens/user_screen.dart';

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
      home: const CommentsScreen(),
    );
  }
}
