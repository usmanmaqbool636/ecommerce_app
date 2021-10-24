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

import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/feeds.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/screens/search.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

/// This is the private State class that goes with BottomBar.
class _BottomBarState extends State<BottomBar> {
  // ignore: unused_field
  int _selectedIndex = 0;
  double iconSize = 27;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: unused_field
  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    Feed(),
    Cart(),
    Search(),
  ];
  // ignore: unused_element
  void _onItemTapped(int index) {
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
      floatingActionButton: Container(
        child: FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: () => _onItemTapped(3),
          child: Icon(Icons.send), //icon inside button
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.red,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white.withOpacity(.60),
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   onTap: (value) {
      //     print(value);
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   },
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       label: 'Favorites',
      //       icon: Icon(Icons.favorite),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Music',
      //       icon: Icon(Icons.music_note),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Places',
      //       icon: Icon(Icons.location_on),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'News',
      //       icon: Icon(Icons.library_books),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold

        color: Colors.redAccent,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            10, //notche margin between floating button and bottom appbar

        child: Container(
          height: 60,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: rowWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      iconSize: iconSize,
                      onPressed: () => _onItemTapped(0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      iconSize: iconSize,
                      onPressed: () => _onItemTapped(1),
                    ),
                  ],
                ),
              ),
              Container(
                width: rowWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.print,
                        color: Colors.white,
                      ),
                      iconSize: iconSize,
                      onPressed: () => _onItemTapped(2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      iconSize: iconSize,
                      onPressed: () => _onItemTapped(3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
