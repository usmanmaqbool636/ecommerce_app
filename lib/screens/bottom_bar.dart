/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/feeds.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/screens/search.dart';
import 'package:ecommerce_app/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constant/my_icons.dart';

/// This is the stateful widget that the main application instantiates.
class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

/// This is the private State class that goes with BottomBar.
class _BottomBarState extends State<BottomBar> {
  // ignore: unused_field
  int _selectedIndex = 2;
  double iconSize = 27;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: unused_field
  static final List<Widget> _widgetOptions = [
    HomeScreen(),
    Feed(),
    Cart(),
    UserInfo(),
    Search()
  ];
  // ignore: unused_element
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var rowWidth = MediaQuery.of(context).size.width * .45;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () => _onItemTapped(4),
        child: Icon(MyAppIcons.search), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          backgroundColor: Colors.red,
          unselectedItemColor: Colors.amber,
          selectedItemColor: _selectedIndex > 3 ? Colors.amber : Colors.black45,
          // showUnselectedLabels: true,
          currentIndex: _selectedIndex > 3 ? 0 : _selectedIndex,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(MyAppIcons.home),
                activeIcon: Icon(MyAppIcons.homeActive)),
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(MyAppIcons.rssFeed),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(MyAppIcons.shopingBag),
            ),
            BottomNavigationBarItem(
                label: 'User',
                icon: Icon(MyAppIcons.user),
                activeIcon: Icon(MyAppIcons.userActive)),
          ],
        ),
        // child: Container(
        //   height: 60,
        //   child: Row(
        //     //children inside bottom appbar
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Container(
        //         width: rowWidth,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             IconButton(
        //               icon: Icon(
        //                 Icons.home,
        //                 color: Colors.white,
        //               ),
        //               iconSize: iconSize,
        //               onPressed: () => _onItemTapped(0),
        //             ),
        //             IconButton(
        //               icon: Icon(
        //                 Icons.search,
        //                 color: Colors.white,
        //               ),
        //               iconSize: iconSize,
        //               onPressed: () => _onItemTapped(1),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: rowWidth,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             IconButton(
        //               icon: Icon(
        //                 Icons.print,
        //                 color: Colors.white,
        //               ),
        //               iconSize: iconSize,
        //               onPressed: () => _onItemTapped(2),
        //             ),
        //             IconButton(
        //               icon: Icon(
        //                 Icons.people,
        //                 color: Colors.white,
        //               ),
        //               iconSize: iconSize,
        //               onPressed: () => _onItemTapped(3),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
