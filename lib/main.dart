import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/services/auth/auth.dart';
import 'package:socialmedia_app/theme/dark_mode.dart';
import 'package:socialmedia_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyC-DZ7if5K-497PhqmTM-VALxLCBCVJOiQ", authDomain: "chatapp1321.firebaseapp.com", projectId: "chatapp1321", storageBucket: "chatapp1321.appspot.com", messagingSenderId: "1082061723479", appId: "1:1082061723479:android:a37866c0b3935b058e1012"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
