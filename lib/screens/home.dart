import 'package:backdrop/backdrop.dart';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return
        // body: BackdropScaffold,
        BackdropScaffold(
      frontLayerBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
      headerHeight: MediaQuery.of(context).size.height * .25,
      appBar: BackdropAppBar(
        title: const Text("Home"),
        leading: const BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorsConstant.startercolor,
            ColorsConstant.endColor
          ])),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.all(10),
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://image.shutterstock.com/shutterstock/photos/1153673752/display_1500/stock-vector-profile-placeholder-image-gray-silhouette-no-photo-1153673752.jpg"),
                radius: 13,
              ),
            ),
          )
        ],
      ),
      backLayer: const Center(
        child: Text("Back Layer"),
      ),
      frontLayer: const Center(
        child: Text("Front Layer"),
      ),
    );
  }
}
