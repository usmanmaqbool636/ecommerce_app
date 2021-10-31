// ignore_for_file: avoid_print, unused_label, prefer_const_declarations

import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool themeValue = false;
  ScrollController? _scrollController;
  var top = 0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: buildFab(),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 100.0,
            right: 0,
            child: FloatingActionButton(
              child: const Icon(Icons.camera_alt_outlined),
              onPressed: () {
                print("Usman Floating Action Button");
              },
            ),
          )
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            elevation: 4,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorsConstant.startercolor,
                        ColorsConstant.endColor,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: top < 100.0 ? 1.0 : 0,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: kToolbarHeight / 1.8,
                                width: kToolbarHeight / 1.8,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 1.0)
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://image.shutterstock.com/shutterstock/photos/1153673752/display_1500/stock-vector-profile-placeholder-image-gray-silhouette-no-photo-1153673752.jpg"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                "Guest",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: const Image(
                      image: NetworkImage(
                          "https://image.shutterstock.com/shutterstock/photos/1153673752/display_1500/stock-vector-profile-placeholder-image-gray-silhouette-no-photo-1153673752.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: userTitle(title: "User Information"),
                ),
                const Divider(thickness: 1, color: Colors.grey),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Email",
                  subTitle: "Sub Email",
                  icon: Icons.email,
                ),
                userListTile(
                  context: context,
                  title: "Phone",
                  subTitle: "Sub Phone",
                  icon: Icons.phone,
                ),
                userListTile(
                  context: context,
                  title: "Shipping Address",
                  subTitle: "",
                  icon: Icons.local_shipping,
                ),
                userListTile(
                  context: context,
                  title: "Joined Date",
                  subTitle: "date",
                  icon: Icons.timer_rounded,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: userTitle(title: "User Setting"),
                ),
                const Divider(thickness: 1, color: Colors.grey),
                userWitchListTile(
                  context: context,
                  title: "Dark Theme",
                  icon: Icons.mode_night_outlined,
                  value: themeValue,
                  changeHandler: (value) {
                    setState(() {
                      themeValue = value;
                    });
                  },
                ),
                userListTile(
                  context: context,
                  title: "Logout",
                  subTitle: "",
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildFab() {
  //   final double defaultTopMargin = 200.0 - 4.0;
  //   final double scaleStart = 160.0;
  //   final double scaleEnd = scaleStart / 2;
  //   double top = defaultTopMargin;
  //   double scale = 1.0;
  //   if (_scrollController!.hasClients) {
  //     double offset = _scrollController!.offset;
  //     top -= offset;
  //     if (offset < defaultTopMargin - scaleStart) {
  //       scale = 1.0;
  //     } else if (offset < defaultTopMargin - scaleEnd) {
  //       scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
  //     } else {
  //       scale = 1.0;
  //     }
  //   }
  //   return Positioned(
  //     top: top,
  //     right: 16.0,
  //     child: Transform(
  //       transform: Matrix4.identity()..scale(scale),
  //       child: FloatingActionButton(
  //         heroTag: "btn1",
  //         onPressed: () {},
  //         child: const Icon(Icons.camera_alt_outlined),
  //       ),
  //     ),
  //   );
  // }

  Widget userTitle({String title = "N/A"}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }

  Material userListTile({
    required BuildContext context,
    String title = "N/A",
    String subTitle = "N/A",
    IconData icon = Icons.wash_rounded,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.amber,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(icon),
        ),
      ),
    );
  }

  Material userWitchListTile({
    required BuildContext context,
    String title = "N/A",
    String subTitle = "",
    IconData icon = Icons.wash_rounded,
    bool value = false,
    required Function changeHandler,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.amber,
        child: SwitchListTile(
          value: value,
          onChanged: (value) {
            print("value $value");
            changeHandler(value);
          },
          title: Text(title),
          subtitle: Text(subTitle),
          secondary: Icon(icon),
        ),
      ),
    );
  }
}
