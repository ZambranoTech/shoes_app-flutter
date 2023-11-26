import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme.bodyLarge;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text(title,style: textTheme!.copyWith(fontSize: 30),),
            const Spacer(),
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.search_outlined)
            )
          ],
        ),
      ),
    );
  }
}