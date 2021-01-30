import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseUser {
  final String uid;

  FirebaseUser({@required this.uid});
}

abstract class AuthBase {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signInAnonymously();
  Future<void> signOut();
}

class CustomAuth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  FirebaseUser _userFromFirebase(User user) {
    return user == null ? null : FirebaseUser(uid: user.uid);
  }

  Future<FirebaseUser> currentUser() async {
    final user = await _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  Future<FirebaseUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
