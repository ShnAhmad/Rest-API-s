import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String buttonText;
  final Widget screen;

  const NavigationButton({
    super.key,
    required this.buttonText,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Text(buttonText),
    );
  }
}
