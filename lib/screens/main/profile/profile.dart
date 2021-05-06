import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhorse_demo/screens/main/posts/list.dart';
import 'package:workhorse_demo/services/posts.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _postService.getPostsByUser(FirebaseAuth.instance.currentUser.uid),
      child: Scaffold(
        body: Container(child: ListPosts()),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text('Home')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.add), title: new Text('Post')),
          ],
        ),
      ),
    );
  }
}
