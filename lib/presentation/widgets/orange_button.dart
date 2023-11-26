import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final Color color;

  const OrangeButton({
    super.key, 
    required this.text, 
    this.width = 45, 
    this.height = 16,
    this.color = Colors.orange
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {}, 
      style: FilledButton.styleFrom(
        backgroundColor: color,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
      ),
      child: Text(text)
    );
  }
}