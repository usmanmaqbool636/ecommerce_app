// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/provider/counter_provider.dart';

// ignore: must_be_immutable
// class Feed extends StatelessWidget {
//   Feed({Key? key}) : super(key: key);
//   CounterProvider counter = CounterProvider();
//   @override
//   Widget build(BuildContext context) {
//     print("building feed Widget");
//     // ignore: unused_local_variable
//     int counterChange = Provider.of<CounterProvider>(context).count;

//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) {
//             return counter;
//           },
//         )
//       ],
//       child: Consumer<CounterProvider>(
//         builder: (context, count, child) {
//           return Scaffold(
//             floatingActionButton: FloatingActionButton(
//               child: const Icon(Icons.plus_one),
//               onPressed: () {
//                 counterChange++;
//               },
//             ),
//             body: Center(
//               child: Text("$counter"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MyHomePage(title: "Home"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Building Home");
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Incremented Value"),
              Consumer<CounterProvider>(
                builder: (_, value, __) {
                  return CounterNumber(number: value.count);
                },
              ),
              // child: CounterNumber(number: count)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              print("Floating Button Pressed");
              Provider.of<CounterProvider>(context, listen: false).increment();
            }));
  }
}

class CounterNumber extends StatelessWidget {
  int number;
  CounterNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Counter Number");
    return Text("$number");
  }
}
