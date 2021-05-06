import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhorse_demo/screens/home/feed.dart';
import 'package:workhorse_demo/screens/main/posts/list.dart';
import 'package:workhorse_demo/services/auth.dart';
import 'package:workhorse_demo/services/posts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;
  final List<Widget> _children = [Feed()];

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value:
            _postService.getPostsByUser(FirebaseAuth.instance.currentUser.uid),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.indigo[200],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              child: Icon(Icons.add)),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text('Workhorse Demo'),
                  decoration: BoxDecoration(color: Colors.indigo[200]),
                ),
                ListTile(
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () async {
                    _authService.signOut();
                  },
                ),
              ],
            ),
          ),
          body: Container(child: ListPosts()),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.indigo[200],
            iconSize: 30,
            onTap: onTabPressed,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.add),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            // currentIndex: _selectedIndex,
            // selectedItemColor: Colors.white,
            // onTap: _onItemTapped,
          ),
        ));
  }
}
