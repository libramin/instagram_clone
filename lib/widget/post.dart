import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/comment.dart';
import 'package:instagram_clone/widget/my_progress_indicator.dart';
import 'package:instagram_clone/widget/rounded_avatar.dart';
import '../constants/common_size.dart';
import '../constants/screen_size.dart';

class Post extends StatelessWidget {
  final int index;

  Post(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Widget _postCaption(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap,vertical: common_xxs_gap),
      child: Comment(showImage: false,userName: 'userName',text: 'I love it!!!',),
    );
  }

  Padding _postLikes() {
    return Padding(
        padding: const EdgeInsets.only(left: common_gap),
        child: Text('좋아요 983개',
        style: TextStyle(fontWeight: FontWeight.bold),),
      );
  }

  Row _postActions() {
    return Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined)),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined)),
        ],
      );
  }

  Widget _postHeader(){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: profileAvatar(),
        ),
        Expanded(child: Text('userName',
        style: TextStyle(fontWeight: FontWeight.bold),)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,
        color: Colors.black87,))
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
        imageUrl: 'https://picsum.photos/id/${index}/200/200',
        placeholder: (BuildContext context, String url) {
          return MyProgressIndicator(containerSize: size?.width,);
        },
        imageBuilder: (BuildContext context, ImageProvider imageProvider) {
          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          );
        },
      );
  }
}



