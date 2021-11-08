// ignore_for_file: sized_box_for_whitespace, avoid_print, must_be_immutable, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  String title;
  int? index;
  double price;
  int count;
  CartFull({
    Key? key,
    this.index,
    required this.title,
    required this.price,
    required this.count,
  }) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  int counter = 1;

  add() {
    ++counter;
    print("title count ${widget.count}");
  }

  subtract() {
    if (widget.count > 1) {
      ++counter;
      print("title count ${widget.count}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = 180;
    return Container(
      height: height,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(left: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .33,
            height: height * .92,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade300,
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 2, //extend the shadow
                    offset: const Offset(
                      1.0, // Move to right 10  horizontally
                      1.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                image: const DecorationImage(
                  image:
                      NetworkImage("https://source.unsplash.com/user/erondu"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Icons.cancel_sharp,
                              size: 22,
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {
                            print("Cancel Icon Pressed");
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("price"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Sub Total"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${widget.price * widget.count}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: themeChange.darkTheme
                              ? Colors.brown.shade900
                              : Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Shipping Free",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: themeChange.darkTheme
                              ? Colors.brown.shade900
                              : Theme.of(context).accentColor,
                        ),
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ),
                          onTap: subtract,
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .12,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorsConstant.gradiendlStart,
                                ColorsConstant.gradiendlEnd
                              ],
                              stops: const [0.0, 0.7],
                            ),
                          ),
                          child: Text(
                            "${widget.count}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 50, color: Colors.green.shade600),
                            ),
                          ),
                          onTap: add,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
