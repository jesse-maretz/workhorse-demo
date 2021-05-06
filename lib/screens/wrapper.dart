import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhorse_demo/auth/signup.dart';
import 'package:workhorse_demo/models/user.dart';
import 'main/home.dart';
import 'main/posts/add.dart';
import 'main/profile/profile.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if (user == null) {
      //show auth system routes
      return SignUp();
    }
    //show main system routes
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/add': (context) => Add(),
      '/profile': (context) => Profile()
    });
  }
}
