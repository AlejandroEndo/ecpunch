import 'package:ecpunch/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecpunch/constants.dart' as Constants;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/punchImg.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight,
                      colors: [
                        Color(0xdd82ac38),
                        Color(0xbb2c81bf),
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Center(
                  child: Image.asset('assets/images/logo-blanco-AI-BI.png'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
            child: Column(
              children: <Widget>[
                LoginButton(
                  type: 'google',
                  icon: FontAwesomeIcons.google,
                  onPressed: () {},
                ),
                LoginButton(
                  type: 'facebook',
                  icon: FontAwesomeIcons.facebook,
                  onPressed: () {},
                ),
                LoginButton(
                  type: 'phone',
                  icon: FontAwesomeIcons.phone,
                  onPressed: () {},
                ),
                LoginButton(
                  type: 'login',
                  onPressed: () {},
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Text(Constants.FORGOT_PASSWORD),
                  onPressed: () {},
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Text(Constants.REGISTER),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
