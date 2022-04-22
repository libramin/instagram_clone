import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/rounded_avatar.dart';

import '../constants/common_size.dart';

class Comment extends StatelessWidget {

  final bool showImage;
  final String userName;
  final String text;
  final DateTime? dateTime;

  Comment({
    Key? key, this.showImage=true, required this.userName, required this.text, this.dateTime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(showImage)
        profileAvatar(size: 24,),
        if(showImage)
        SizedBox(width: common_gap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: userName,
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87)),
                      TextSpan(text: '   '),
                      TextSpan(text: text,
                          style: TextStyle(color: Colors.black87))
                    ]
                )
            ),
            if(dateTime != null)
            Text(dateTime.toString(),style: TextStyle(color: Colors.grey[400],
                fontSize: 12),)
          ],
        ),
      ],
    );
  }
}