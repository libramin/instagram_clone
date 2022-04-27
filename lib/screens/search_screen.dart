import 'package:flutter/material.dart';

import '../widget/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<bool> followings = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: profileAvatar(),
                title: Text('UserName $index'),
                subtitle: Text('UserBio $index'),
                trailing: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: followings[index]?Colors.white : Colors.blue,
                        side: BorderSide(color: followings[index]? Colors.black: Colors.blue)),
                    onPressed: () {
                      setState(() {
                        followings[index] = !followings[index];
                      });
                    },
                    child: Text(
                      followings[index]?'팔로우 취소':'팔로우',
                      style: TextStyle(
                          color: followings[index]?Colors.black:Colors.white, fontWeight: FontWeight.bold),
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            itemCount: followings.length));
  }
}
