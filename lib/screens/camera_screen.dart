import 'package:flutter/material.dart';
import 'package:instagram_clone/model/camera_state.dart';
import 'package:instagram_clone/model/gallery_state.dart';
import 'package:instagram_clone/widget/my_gallery.dart';
import 'package:instagram_clone/widget/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  
  CameraState cameraState = CameraState();
  GalleryState galleryState = GalleryState();
  CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState (){
    cameraState.getReadyToTakePhoto();
    galleryState.initProvider();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = 'PHOTO';

  @override
  void dispose() {
    _pageController.dispose();
    widget.cameraState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(value: widget.cameraState),
        ChangeNotifierProvider<GalleryState>.value(value: widget.galleryState)
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: PageView(
            controller: _pageController,
            children: [
              MyGallery(),
              TakePhoto(),
              Container(
                color: Colors.green,
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 0,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.black54,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'GALLERY'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'PHOTO'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'VIDEO'),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(_currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn);
              });
            },
          )),
    );
  }
}
