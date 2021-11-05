import 'package:ecommerce_app/screens/cart/cart_empty.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CartEmpty(),
      ),
    );
  }
}
