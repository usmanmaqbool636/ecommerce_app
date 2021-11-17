// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, required this.name, required this.imgPath})
      : super(key: key);
  String name;
  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          margin: const EdgeInsets.only(left: 12, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Theme.of(context).backgroundColor,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Theme.of(context).textSelectionColor,
            ),
          ),
        )
      ],
    );
  }
}
