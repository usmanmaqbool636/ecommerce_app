import 'package:flutter/material.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({Key? key}) : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 290,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).backgroundColor),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * .3,
              ),
              child: Image.network(
                "https://source.unsplash.com/random",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
            child: Column(),
          ),
        ],
      ),
    );
  }
}
