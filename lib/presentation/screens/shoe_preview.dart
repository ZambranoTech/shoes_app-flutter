import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_app/presentation/config/helpers/herlpers.dart';
import 'package:shoes_app/presentation/providers/shoe_provider.dart';
import 'package:shoes_app/presentation/widgets/widgets.dart';

class ShoeDescScreen extends StatelessWidget {
  const ShoeDescScreen({super.key});

  @override
  Widget build(BuildContext context) {

    cambiarStatusLight();

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(
              children: [
                const Hero(
                    tag: 'zapato-1',
                    child: ShoeSize(
                      fullScreen: true,
                    )
                  ),
                Positioned(
                  top: 60,
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    child: const Icon(Icons.arrow_back_ios_outlined, size: 40,),
                    onPressed: () {
                      context.pop();
                      cambiarStatusDark();
                    },
                    elevation: 0,
                    highlightElevation: 0,
                  ),
                ),                
              ],
            ),
            const ShoeDescription(),
            const AddToCart(amount: 180, buttonText: 'Buy now',height: 5, bounce: true,),
            const _ColoresyMas(),
            const _IconosSombreados(),
            
          ],
        ),
      ),
    );
  }
}

class _IconosSombreados extends StatelessWidget {
  const _IconosSombreados({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _IconoSombreado(
            icon: Icons.favorite_outlined,
            color: Colors.red,
          ),
          _IconoSombreado(
            icon: Icons.shopping_cart_rounded,
            color: Colors.grey.withOpacity(0.5),
          ),
          _IconoSombreado(
            icon: Icons.settings,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}

class _IconoSombreado extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _IconoSombreado({
    required this.icon, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, color: color,),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: -5,
            offset: Offset(0, 5)
          )
        ]
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
                child: _BtnColor(color: Colors.lightGreenAccent.shade400, index: 4, imageUrl: 'assets/images/verde.png', )
              ),
              const Positioned(
                left: 65,
                child: _BtnColor(color: Colors.orange, index: 3, imageUrl: 'assets/images/amarillo.png',)
              ),
              const Positioned(
                left: 35,
                child: _BtnColor(color: Colors.blue, index: 2, imageUrl: 'assets/images/azul.png',)
              ),
              const _BtnColor(color: Colors.grey, index: 1, imageUrl: 'assets/images/negro.png',),
            ],
          ),
          const Spacer(),
          OrangeButton(text: 'More related items', height: 0.5, color: Colors.orange.shade200, )
          
        ],
      ),
    );
  }
}

class _BtnColor extends ConsumerWidget {
  final Color color;
  final int index;
  final String imageUrl;
  
  const _BtnColor( {
    required this.color,
    required this.index,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(shoeProvider.notifier).setColor(imageUrl);
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 200),
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
        ),
      ),
    );
  }
}