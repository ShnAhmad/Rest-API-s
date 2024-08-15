import 'package:flutter/material.dart';
import 'package:rest_apis/GetApis/album_screen.dart';
import 'package:rest_apis/GetApis/comments_screen.dart';
import 'package:rest_apis/GetApis/product_screen.dart';
import 'package:rest_apis/GetApis/user_screen.dart';
import 'package:rest_apis/PostApis/login_screen.dart';
import 'package:rest_apis/components/navigation_button.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('Get Data'),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    GridButton(
                        text: 'Albums',
                        icon: Icons.album,
                        screen: AlbumScreen()),
                    GridButton(
                        text: 'Comments',
                        icon: Icons.comment,
                        screen: CommentsScreen()),
                    GridButton(
                        text: 'Products',
                        icon: Icons.shopping_bag,
                        screen: ProductScreen()),
                    GridButton(
                        text: 'Users',
                        icon: Icons.people,
                        screen: UserScreen()),
                  ],
                ),
              ),
              _buildSectionTitle('Post Data'),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    GridButton(
                        text: 'Login',
                        icon: Icons.login,
                        screen: LoginScreen()),
                    // Add more post data options here in the future
                    // GridButton(text: 'Register', icon: Icons.person_add, screen: RegisterScreen()),
                    // GridButton(text: 'Create Post', icon: Icons.post_add, screen: CreatePostScreen()),
                    // GridButton(text: 'Upload', icon: Icons.upload_file, screen: UploadScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade700,
        ),
      ),
    );
  }
}

class GridButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget screen;

  const GridButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.teal.shade700,
        backgroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.teal),
          SizedBox(height: 8),
          Text(text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
