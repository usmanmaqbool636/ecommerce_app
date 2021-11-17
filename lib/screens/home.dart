// ignore_for_file: avoid_print

import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/widget/category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List carouselItemsList = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
  ];
  List brandsImages = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
  ];
  List<Map<String, dynamic>> categories = [
    {"name": "Phones", "imagPath": "assets/images/CatPhones.png"},
    {"name": "Clothes", "imagPath": "assets/images/CatClothes.jpg"},
    {"name": "Shoes", "imagPath": "assets/images/CatShoes.jpg"},
    {"name": "Buety&Health", "imagPath": "assets/images/CatBeauty.jpg"},
    {"name": "Laptops", "imagPath": "assets/images/CatLaptops.png"},
    {"name": "Furniture", "imagPath": "assets/images/CatFurniture.jpg"},
    {"name": "Watches", "imagPath": "assets/images/CatWatches.jpg"}
  ];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      frontLayer: SingleChildScrollView(
        child: Column(
          children: [
            carouselSliderTop(context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Brands",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      print("Pressed");
                    },
                    child: const Text(
                      "View all...",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(
                      name: categories[index]["name"],
                      imgPath: categories[index]["imagPath"],
                    );
                  },
                ),
              ),
            ),
            carouselSliderBrands()
          ],
        ),
      ),
    );
  }

  CarouselSlider categorySlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 210,
      ),
      items: brandsImages.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                print(item);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.blueGrey),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider carouselSliderBrands() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 210,
        autoPlay: true,
      ),
      items: brandsImages.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                print(item);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.blueGrey),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget carouselSliderTop(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: carouselItemsList.map((i) {
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
            children: carouselItemsList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(entry.key);
                },
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
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
    );
  }
}
