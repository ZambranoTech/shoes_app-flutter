import 'package:flutter/material.dart';

class ShoeSize extends StatelessWidget {
  final bool fullScreen;

  const ShoeSize({
    super.key, 
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ShoeWithShadowAndSize(fullScreen),
      ],
    );
  }
}

class _ShoeWithShadowAndSize extends StatelessWidget {

  final bool fullScreen;
  const _ShoeWithShadowAndSize(this.fullScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        _ShoeSizeBox(7),
        _ShoeSizeBox(7.5),
        _ShoeSizeBox(8),
        _ShoeSizeBox(8.5),
        _ShoeSizeBox(9),
        _ShoeSizeBox(9.5),
      ],
    );
  }
}


class _ShoeSizeBox extends StatelessWidget {
  final double number;
  const _ShoeSizeBox(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: number != 9 ? Colors.white : Colors.orangeAccent,
        boxShadow: number != 9 
        ? null 
        : [BoxShadow(
            blurRadius: 20,
            spreadRadius: -10,
            offset: const Offset(2, 10),
            color: Colors.orange.shade900

          )]
      ),
      child: number != 9 
        ? Text(number.toString().replaceAll('.0', ''), style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),)
        : Text(number.toString().replaceAll('.0', ''), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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

class _Shoe extends StatelessWidget {
  const _Shoe();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset('assets/images/azul.png', width: 300,),
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