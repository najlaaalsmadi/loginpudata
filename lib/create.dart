import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pojectfinal/home.dart';

class Create extends StatefulWidget {
  const Create({Key? key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _auth = FirebaseAuth.instance;
  var _showPassword = true;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              margin: const EdgeInsets.all(20),
              width: 650,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      _password = value;
                    },
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.password),
                      hintStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      try {
                        await _auth.createUserWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    height: 50,
                    minWidth: 400,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}