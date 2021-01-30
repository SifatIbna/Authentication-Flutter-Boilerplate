import 'package:authentication_flutter/Components/reusable_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({
    @required this.onSignIn,
    @required this.auth,
  });

  final Function(FirebaseUser) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    // SHow loading
    try {
      FirebaseUser user = await auth.signInAnonymously();
      // print('${authResult.user.uid}');
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'RICH IT',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign IN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ReusableButton(
              text: 'Sign In with Google',
              textColor: Colors.black87,
              btnColor: Colors.white,
              onPress: () {},
              iconData: FontAwesomeIcons.google,
            ),
            SizedBox(
              height: 8,
            ),
            ReusableButton(
              text: 'Log In with Facebook',
              textColor: Colors.white,
              btnColor: Colors.blue,
              onPress: () {},
              iconData: FontAwesomeIcons.facebook,
            ),
            SizedBox(
              height: 8,
            ),
            ReusableButton(
              text: 'Sign In with email',
              textColor: Colors.black12,
              btnColor: Colors.white,
              onPress: () {},
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'or',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            ReusableButton(
              textColor: Colors.lightBlue,
              btnColor: Colors.blueGrey,
              text: 'Anonymous Login',
              onPress: _signInAnonymously,
            ),
          ],
        ),
      ),
    );
  }
}
