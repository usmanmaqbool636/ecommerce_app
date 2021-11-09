import 'package:flutter/material.dart';

import 'feed_products.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        // crossAxisSpacing: 8,
        childAspectRatio: 240 / 290,
        children: List.generate(100, (index) => const FeedProducts()),
      ),
    );
  }
}
