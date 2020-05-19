import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;
  bool _loading = false;
  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _user;
  FirebaseUser get user => _user;

  String _verificationCode;
  String get verificationCode => _verificationCode;

  void _updateLogInState(user) =>
      user != null ? _loggedIn = true : _loggedIn = false;

  void logInGoogle() async {
    _loading = true;
    _user = await _handleGoogleSignIn();
    _loading = false;
    _updateLogInState(_user);
    notifyListeners();
  }

  void logiInFacebook() async {
    _loading = true;
    _user = await _handleFacebookSignIn();
    _loading = false;
    _updateLogInState(_user);
    notifyListeners();
  }

  void logInEmail(String email, String password, BuildContext _context) async {
    _loading = true;
    Map<String, dynamic> result =
        await _signInWithEmailAndPassword(email, password);
    if (!result['error']) {
      _user = result['user'];
      Navigator.of(_context).pop();
    } else {
      Scaffold.of(_context).showSnackBar(SnackBar(
        content: Text(result['message']),
      ));
    }
    _loading = false;
    _updateLogInState(_user);
    notifyListeners();
  }

  void logInPhone(String phoneNumber, BuildContext _context) async {}

  void signUp(String email, String password, BuildContext _context) async {
    _loading = true;
    Map<String, dynamic> result =
        await _registerWithEmailAndPassword(email, password);
    if (!result['error']) ;
    if (result['error']) {
      Scaffold.of(_context).showSnackBar(SnackBar(
        content: Text(result['message']),
      ));
    } else {
      _user = result['user'];
      Navigator.of(_context).pop();
    }
    _loading = false;
    _updateLogInState(_user);
    notifyListeners();
  }

  void logout() {
    _signOut();
    _loggedIn = false;
    notifyListeners();
  }

  Future<FirebaseUser> _handleGoogleSignIn() async {
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

  Future<FirebaseUser> _handleFacebookSignIn() async {
    var result = await _facebookLogin.logIn(['email']);
    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      return user;
    }
    return null;
  }

  Future<Map<String, dynamic>> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return {'user': user, 'error': false};
    } catch (error) {
      return {'error': true, 'message': error.message};
    }
  }

  Future<Map<String, dynamic>> _registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return {'user': user, 'error': false};
    } catch (error) {
      return {'error': true, 'message': error.message};
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

  void verifyPhoneNumber(String phoneNumber, BuildContext _context) async {
    print(phoneNumber);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 5),
      verificationCompleted: (authCredential) =>
          verificationComplete(authCredential, _context),
      verificationFailed: (authException) =>
          verificationFailed(authException, _context),
      codeAutoRetrievalTimeout: (verificationId) =>
          codeAutoRetrievalTimeout(verificationId),
      codeSent: (verificationId, [code]) => smsCodeSent(
        verificationId,
        [code],
      ),
    );
    notifyListeners();
  }

  verificationComplete(AuthCredential authCredential, BuildContext _context) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      Navigator.of(_context).pushNamed('/phoneCode');
    });
    notifyListeners();
  }

  smsCodeSent(String verificationId, List<int> code) {
    print(verificationId);
    _verificationCode = verificationId;
    notifyListeners();
  }

  verificationFailed(AuthException authException, BuildContext _context) {
    Scaffold.of(_context).showSnackBar(SnackBar(
      content: Text("Exception!! message:" + authException.message.toString()),
    ));
    notifyListeners();
  }

  codeAutoRetrievalTimeout(String verificationId) {
    print(verificationId);
    _verificationCode = verificationId;
    notifyListeners();
  }
}
