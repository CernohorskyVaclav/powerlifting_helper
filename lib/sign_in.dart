import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        title: Text("Sign-in page (test)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign-in with Google",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              onPressed: _signInWithGoogle,
              color: Colors.orange[500],
            )
          ],
        ),
      ),
    );
  }

  _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final User user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }
}
