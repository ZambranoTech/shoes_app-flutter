import 'package:flutter/material.dart';
import 'package:shoes_app/presentation/config/helpers/herlpers.dart';
import 'package:shoes_app/presentation/widgets/add_to_cart.dart';
import 'package:shoes_app/presentation/widgets/custom_appbar.dart';
import 'package:shoes_app/presentation/widgets/shoe_description.dart';
import 'package:shoes_app/presentation/widgets/shoe_shize.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'For you',),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'zapato-1',
                    child: ShoeSize()
                  ),
                  ShoeDescription(),
                  AddToCart(amount: 180, buttonText: 'Buy Now',),
                  SizedBox(height: 20,),

                ],
              ),
            )
          )
        ],
      ),
    );
  }
}