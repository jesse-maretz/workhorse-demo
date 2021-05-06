import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhorse_demo/screens/main/posts/list.dart';
import 'package:workhorse_demo/services/posts.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _postService.getPostsByUser(FirebaseAuth.instance.currentUser.uid),
      child: Scaffold(body: ListPosts()),
    );
  }
}
