import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class HomePage extends StatelessWidget {
  HomePage({
    this.onSignOut,
    this.authBase,
  });

  final VoidCallback onSignOut;
  final AuthBase authBase;

  Future<void> _signOut() async {
    try {
      await authBase.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RICH-IT',
        ),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
