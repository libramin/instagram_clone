import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/screens/share_post_screen.dart';
import 'package:instagram_clone/widget/my_progress_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../model/camera_state.dart';
import 'dart:io';

class TakePhoto extends StatefulWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _controller;
  Widget _progress = MyProgressIndicator();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
      builder: (BuildContext context, CameraState cameraState, Widget? child) {
        return Column(
          children: [
            Container(
              width: size!.width,
              height: size!.width,
              color: Colors.black,
              child: (cameraState.isReadyToTakePhoto)
                  ? _getPreview(cameraState)
                  : _progress,
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.black12, width: 30),
                  ),
                  onPressed: () {
                    if (cameraState.isReadyToTakePhoto) {
                      _attempTakePhoto(context,cameraState);
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                  )),
            )
          ],
        );
      },
    );
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Container(
              width: size!.width,
              height: size!.width / cameraState.controller.value.aspectRatio,
              child: CameraPreview(cameraState.controller)),
        ),
      ),
    );
  }

  void _attempTakePhoto(BuildContext context, CameraState cameraState) async {
    // final String timeInMilli = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      // final path = join((await getTemporaryDirectory()).path, '$timeInMilli.png');

      XFile PictureTaken = await cameraState.controller.takePicture();
      File imageFile = File(PictureTaken.path);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SharePostScreen(imageFile)));
    } catch (e) {

    }
  }
}
