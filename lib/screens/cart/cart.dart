// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:ecommerce_app/constant/my_icons.dart';
import 'package:ecommerce_app/screens/cart/cart_empty.dart';
import 'package:ecommerce_app/screens/cart/cart_full.dart';

class Cart extends StatefulWidget {
  // List<String>? products = [];

  Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List products = <CartItems>[
    CartItems(title: "Shoes", price: 100, count: 1),
    CartItems(title: "Shoes", price: 100, count: 1),
    CartItems(title: "Shoes", price: 29, count: 3),
    CartItems(title: "Shoes", price: 100, count: 1),
  ];
  double sum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products.forEach((e) => sum += e.price * e.count);
  }

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Scaffold(
            appBar: emptyAppBar(),
            body: const CartEmpty(),
          )
        : Scaffold(
            appBar: fullAppBar(count: products.length),
            body: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    CartItems item = products[index];
                    return CartFull(
                      index: index,
                      title: item.title,
                      count: item.count,
                      price: item.price,
                    );
                  }),
            ),
            // body: const CartFull(),
            bottomSheet: checkoutSection(context),
          );
  }

  AppBar fullAppBar({int count = 0}) {
    return AppBar(
      title: Text(
        "Cart ($count)",
        style: const TextStyle(fontSize: 25),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(MyAppIcons.trash),
            tooltip: 'Open shopping cart',
            onPressed: () {
              print("del Button pressed");
            },
          ),
        ),
      ],
      centerTitle: false,
    );
  }

  AppBar emptyAppBar() {
    return AppBar(
      title: const Text(
        "Cart",
        style: TextStyle(fontSize: 25),
      ),
      centerTitle: true,
    );
  }

  Widget checkoutSection(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(ctx).textSelectionColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Total:",
              style: TextStyle(
                color: Theme.of(ctx).textSelectionColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "US \$$sum",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItems {
  String title;
  double price;
  int count;
  CartItems({
    required this.title,
    required this.price,
    required this.count,
  });

  void addCountByOne() {
    ++count;
    print("[addCountByOne] $count");
  }

  void decreseCountByOne() {
    --count;
  }
}
