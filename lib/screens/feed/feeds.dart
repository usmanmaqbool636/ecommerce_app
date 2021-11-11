import 'package:flutter/material.dart';

import 'feed_products.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        centerTitle: true,
      ),
      // body: StaggeredGridView.countBuilder(
      //   crossAxisCount: 4,
      //   itemCount: 8,
      //   itemBuilder: (BuildContext context, int index) => const FeedProducts(),
      //   staggeredTileBuilder: (int index) =>
      //       StaggeredTile.count(2, index.isEven ? 4 : 5),
      //   mainAxisSpacing: 4.0,
      //   crossAxisSpacing: 4.0,
      // ),

      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        childAspectRatio: 240 / 290,
        children: List.generate(100, (index) => const FeedProducts()),
      ),
    );
  }
}
