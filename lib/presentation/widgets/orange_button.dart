import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String text;
  final double width;
  final double height;

  const OrangeButton({
    super.key, 
    required this.text, 
    this.width = 45, 
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {}, 
      style: FilledButton.styleFrom(
        backgroundColor: Colors.orange,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
      ),
      child: Text(text)
    );
  }
}