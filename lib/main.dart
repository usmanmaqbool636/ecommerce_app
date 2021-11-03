// import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:ecommerce_app/constant/theme_data.dart';
import 'package:ecommerce_app/provider/dark_theme_provider.dart';
import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeDate, child) {
          return MaterialApp(
            title: 'Ecomerce App',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const SafeArea(child: BottomBar()),
          );
        }));
  }
}
