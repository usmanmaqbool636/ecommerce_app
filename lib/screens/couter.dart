// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/provider/counter_provider.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: const MyHomePage(title: "Home"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterProvider counterProvider = CounterProvider();
  Future<void> getCurrentCounter() async {
    counterProvider.count = await counterProvider.counterPrefrence.getCounter();
    print("counterProvider.count ${counterProvider.count}");
  }

  @override
  void initState() {
    super.initState();
    print("${counterProvider.count} count");
    getCurrentCounter();
    counterProvider.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Incremented Value"),
              ChangeNotifierProvider(
                create: (_) => counterProvider,
                child: Consumer<CounterProvider>(
                  builder: (_, cp, __) {
                    print("cp=> ${cp.count}");
                    return CounterNumber(number: cp.count);
                  },
                ),
              ),
              // child: CounterNumber(number: count)),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green,
                child: const Icon(Icons.plus_one),
                onPressed: () {
                  print("Floating Button Pressed");
                  counterProvider.increment();
                  // Provider.of<CounterProvider>(context, listen: false).increment();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: Colors.amber,
                child: const Icon(Icons.exposure_minus_1),
                onPressed: () {
                  print("Floating Button Pressed");
                  counterProvider.decrement();
                  // Provider.of<CounterProvider>(context, listen: false).increment();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.cancel),
                onPressed: () {
                  print("Floating Button Pressed");
                  counterProvider.resetValue();
                  // Provider.of<CounterProvider>(context, listen: false).increment();
                },
              ),
            ],
          ),
        ));
  }
}

class CounterNumber extends StatelessWidget {
  final int number;
  const CounterNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Counter Number");
    return Text("$number");
  }
}
