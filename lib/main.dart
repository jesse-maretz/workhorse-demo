import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhorse_demo/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workhorse_demo/screens/wrapper.dart';
import 'package:workhorse_demo/services/auth.dart';

import 'models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        // return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserModel>.value(
            value: AuthService().user,
            child: MaterialApp(home: Wrapper()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Your feed is loading', textDirection: TextDirection.ltr);
      },
    );
  }
}
