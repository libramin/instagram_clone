import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems =[
    BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: ''),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.yellow,),
    Container(color: Colors.green,),
    Container(color: Colors.blue,),
    Container(color: Colors.grey,),
  ];

  @override
  Widget build(BuildContext context) {
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

  void _onBtmItemClick(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
