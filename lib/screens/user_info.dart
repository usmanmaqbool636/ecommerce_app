// ignore_for_file: avoid_print, unused_label

import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool themeValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
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
            padding: const EdgeInsets.only(left: 8.0),
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
    );
  }

  Text userTitle({String title = "N/A"}) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
