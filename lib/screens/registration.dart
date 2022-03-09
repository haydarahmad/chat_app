import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'REGISTRATION';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset('image/logo.png'),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                  hintText: 'input your Email',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent, width: 2.0))),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: const InputDecoration(
                  hintText: 'input your Pasword',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent, width: 2.0))),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 42,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
