import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/profile_body.dart';

import '../constants/screen_size.dart';
import '../widget/profile_side_menu.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final menuWidth = size!.width / 3*2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXpos = 0;
  double menuXpos = size!.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: ProfileBody(
              onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.opened
                      : MenuStatus.closed;
                  switch (_menuStatus) {
                    case MenuStatus.opened:
                      bodyXpos = -menuWidth;
                      menuXpos = size!.width - menuWidth;
                      break;
                    case MenuStatus.closed:
                      bodyXpos = 0;
                      menuXpos = size!.width;
                      break;
                  }
                });
              },
            ),
            transform: Matrix4.translationValues(bodyXpos, 0, 0),
          ),
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: ProfileSideMenu(menuWidth),
            transform: Matrix4.translationValues(menuXpos, 0, 0),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { opened, closed }
