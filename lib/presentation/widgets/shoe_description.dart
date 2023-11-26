import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {


  const ShoeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nike Air Max 720', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      style: TextStyle(color: Colors.grey.shade700, height: 1.8),),
              ],
            ),
          );
  }
}