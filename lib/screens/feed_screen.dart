import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('instagram',
        style: TextStyle(
          fontFamily: 'VeganStyle',color: Colors.black87,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return Post(index);
          }),
    );
  }
}