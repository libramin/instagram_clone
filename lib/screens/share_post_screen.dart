import 'dart:io';
import 'package:flutter/material.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen(this.imageFile,{Key? key}) : super(key: key);

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Image.file(imageFile);
  }
}
