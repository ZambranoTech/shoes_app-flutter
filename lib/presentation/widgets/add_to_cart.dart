import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/presentation/widgets/orange_button.dart';

class AddToCart extends StatelessWidget {
  final double amount;
  final String buttonText;
  final double width;
  final double height;
  final bool bounce;

  const AddToCart({
    super.key, 
    required this.amount, 
    required this.buttonText, 
    this.width = 15, 
    this.height = 5, 
    this.bounce = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.03),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\$ $amount', style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
          const Spacer(),
          Bounce(
            animate: bounce,
            delay: Duration(seconds: 1),
            from: 8,
            child: const OrangeButton(text: 'Buy Now', )
          ),          
        ],
      ),
    );
  }
}

