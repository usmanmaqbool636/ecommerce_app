// ignore_for_file: avoid_print

import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List itemsList = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
  ];
  final CarouselController _controller = CarouselController();
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
            padding: const EdgeInsets.all(10),
            icon: const CircleAvatar(
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
      frontLayer: Stack(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: itemsList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 190,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 1, milliseconds: 500),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  _current = index;
                });
                print(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemsList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToPage(entry.key);
                  },
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      // frontLayer: SizedBox(
      //   height: 150.0,
      //   width: 300.0,
      //   child: Carousel(
      //     boxFit: BoxFit.cover,
      //     autoplay: false,
      //     animationCurve: Curves.fastOutSlowIn,
      //     animationDuration: Duration(milliseconds: 1000),
      //     dotSize: 6.0,
      //     dotIncreasedColor: Color(0xFFFF335C),
      //     dotBgColor: Colors.transparent,
      //     dotPosition: DotPosition.topRight,
      //     dotVerticalPadding: 10.0,
      //     showIndicator: true,
      //     indicatorBgPadding: 7.0,
      //     images: [
      //       NetworkImage(
      //           'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
      //       NetworkImage(
      //           'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
      //       ExactAssetImage("assets/images/LaunchImage.jpg"),
      //     ],
      //   ),
      // ),
    );
  }
}
