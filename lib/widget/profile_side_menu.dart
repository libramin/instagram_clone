import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  ProfileSideMenu(this.menuWidth, {Key? key}) : super(key: key);

  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: menuWidth,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => AuthScreen()));
                },
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black87),
                ),
              )
            ],
          )),
    );
  }
}
