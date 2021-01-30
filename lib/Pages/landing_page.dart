import 'package:authentication_flutter/Pages/sign_in_page.dart';
import 'package:flutter/cupertino.dart';

import '../auth.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  LandingPage({
    @required this.auth,
  });

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    FirebaseUser user = await widget.auth.currentUser();
    _updateUser(user: user);
  }

  void _updateUser({FirebaseUser user}) {
    // print("User id: ${user?.uid}");
    setState(
      () {
        _user = user;
      },
    );
    // if showing dilaog - hide dialog
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: (user) {
          //ANIMATION
          _updateUser(user: user);
        },
      );
    }

    return HomePage(
      authBase: widget.auth,
      onSignOut: () {
        _updateUser(user: null);
      },
    );
  }
}
