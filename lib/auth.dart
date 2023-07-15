import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pojectfinal/home.dart';
import 'package:pojectfinal/login.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(); // تعديل هنا لعرض الصفحة المطلوبة بعد تسجيل الدخول
          } else {
            return Login();
          }
        },
      ),
    );
  }
}