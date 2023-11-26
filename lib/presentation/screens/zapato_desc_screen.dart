import 'package:flutter/material.dart';
import 'package:shoes_app/presentation/widgets/add_to_cart.dart';
import 'package:shoes_app/presentation/widgets/shoe_description.dart';
import 'package:shoes_app/presentation/widgets/shoe_shize.dart';

class ShoeDescScreen extends StatelessWidget {
  const ShoeDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            ShoeSize(
              fullScreen: true
            ),
            ShoeDescription(),
            AddToCart(amount: 180, buttonText: 'Buy now',height: 5,),
            _ColoresyMas()
            
          ],
        ),
      ),
    );
  }
}

class _ColoresyMas extends StatelessWidget {
  const _ColoresyMas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              const SizedBox(width: 150,),
               Positioned(
                left: 95,
                child: _btnColor(color: Colors.lightGreenAccent.shade400,)
              ),
              const Positioned(
                left: 65,
                child: _btnColor(color: Colors.orange,)
              ),
              const Positioned(
                left: 35,
                child: _btnColor(color: Colors.blue,)
              ),
              const _btnColor(color: Colors.grey,
              ),
            ],
          )
          
        ],
      ),
    );
  }
}

class _btnColor extends StatelessWidget {
  final Color color;
  const _btnColor({
    super.key, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }
}