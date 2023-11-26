import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_app/presentation/config/helpers/herlpers.dart';
import 'package:shoes_app/presentation/providers/shoe_provider.dart';

class ShoeSize extends StatelessWidget {
  final bool fullScreen;

  const ShoeSize({
    super.key, 
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return _ShoeWithShadowAndSize(fullScreen);
  }
}

class _ShoeWithShadowAndSize extends StatelessWidget {

  final bool fullScreen;
  const _ShoeWithShadowAndSize(this.fullScreen);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !fullScreen
      ? () {
        cambiarStatusDark();
        context.push('/shoe-preview') ;
      } 
      : null,
      child: Container(
        alignment: Alignment.topCenter,
        margin: fullScreen
        ? const EdgeInsets.all(8)
        : const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 480,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.yellow.shade600,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              const Spacer(),
    
              fullScreen
              ? const SizedBox()
              : const _ListSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListSizes extends StatelessWidget {
  const _ListSizes();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ShoeSizeBox(7, 6),
        _ShoeSizeBox(7.5, 5),
        _ShoeSizeBox(8, 4),
        _ShoeSizeBox(8.5, 3),
        _ShoeSizeBox(9, 2),
        _ShoeSizeBox(9.5, 1),
      ],
    );
  }
}


class _ShoeSizeBox extends ConsumerWidget {
  final double number;
  final int index;
  const _ShoeSizeBox(this.number, this.index);

  @override
  Widget build(BuildContext context, ref) {

    final shoe = ref.watch(shoeProvider);

    return GestureDetector(
      onTap: () => ref.read(shoeProvider.notifier).setSize(number),
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 280),
        duration: const Duration(milliseconds: 100),
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: shoe.selectedSize != number  ? Colors.white : Colors.orangeAccent,
            boxShadow: shoe.selectedSize != number
            ? null 
            : [BoxShadow(
                blurRadius: 20,
                spreadRadius: -10,
                offset: const Offset(2, 10),
                color: Colors.orange.shade900
      
              )]
          ),
          child: shoe.selectedSize != number 
            ? Text(number.toString().replaceAll('.0', ''), style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),)
            : Text(number.toString().replaceAll('.0', ''), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _Shoe(),
        Positioned(
          bottom: 0,
          right: 0,
          child: _ShoeShadow(),
        )
      ],
    );
  }
}

class _Shoe extends ConsumerWidget {
  const _Shoe();

  @override
  Widget build(BuildContext context, ref) {

    final shoeImage = ref.watch(shoeProvider).selectedColor;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset(shoeImage, width: 300,),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
      width: 230,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            spreadRadius: -20,
            color: Colors.orange.shade900,
          )
        ]
      ),
            ),
    );
  }

  
}