import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/camera_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import 'constants/screen_size.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = [
    FeedScreen(),
    SearchScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: btmNavItems,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black87,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onBtmItemClick),
    );
  }

  void _onBtmItemClick(int index) {
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        {
          setState(() {
            _selectedIndex = index;
          });
        }
    }
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context))
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CameraScreen()));
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                AppSettings.openAppSettings();
              }),
          content: Text('사진, 파일, 마이크 접근을 허용 해 주세요!')));
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.photos,
      Permission.storage
    ].request();
    bool permitted = true;

    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });
    return permitted;
  }
}
