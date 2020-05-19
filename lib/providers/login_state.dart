import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;
  bool _loading = false;
  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _user;
  FirebaseUser get user => _user;

  void logInGoogle() async {
    _loading = true;
    _user = await _handleSignIn();
    _loading = false;
    _user != null ? _loggedIn = true : _loggedIn = false;
    notifyListeners();
  }

  void logInEmail(String email, String password) async {
    _loading = true;
    _user = await _signInWithEmailAndPassword(email, password);
    _loading = false;
    _user != null ? _loggedIn = true : _loggedIn = false;
    notifyListeners();
  }

  void signUp(String email, String password) async {
    _loading = true;
    _user = await _registerWithEmailAndPassword(email, password);
    _loading = false;
    _user != null ? _loggedIn = true : _loggedIn = false;
    notifyListeners();
  }

  void logout() {
    _signOut();
    _loggedIn = false;
    notifyListeners();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future _signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future _registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future _signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
