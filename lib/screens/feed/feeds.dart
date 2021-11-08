import 'package:flutter/material.dart';

import 'feed_products.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedProducts(),
    );
  }
}
