// ignore_for_file: deprecated_member_use, avoid_print

import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: const EdgeInsets.only(top:80 ),
              width: double.infinity,
              height: size.height * .4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/emptycart.png"),
                ),
              ),
            ),
            Text(
              "Your Cart is Empty",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeChange.darkTheme
                    ? Theme.of(context).textSelectionColor
                    : Theme.of(context).primaryColorDark,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Looks Like you didn't add anything to your cart yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeChange.darkTheme
                    ? Theme.of(context).disabledColor
                    : ColorsConstant.subTitle,
                fontSize: 26,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width * .85,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    print("Shop button pressed");
                  },
                  child: Text(
                    "Shop Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.red),
                    ),
                  )
                  // ButtonStyle(
                  //   // shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
                  //   ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
