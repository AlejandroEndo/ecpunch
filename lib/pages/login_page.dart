import 'package:ecpunch/providers/login_state.dart';
import 'package:ecpunch/widgets/forgot_password_button.dart';
import 'package:ecpunch/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Provider loginState;
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
                      fit: BoxFit.cover,
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
            child: Consumer<LoginState>(
              builder: (BuildContext context, LoginState value, Widget child) {
                if (value.isLoading())
                  return CircularProgressIndicator();
                else
                  return child;
              },
              child: Column(
                children: <Widget>[
                  LoginButton(
                    type: 'google',
                    icon: FontAwesomeIcons.google,
                    onPressed: () {
                      context.read<LoginState>().logInGoogle();
                    },
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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/customLogin');
                    },
                  ),
                  ForgotPasswordButton(
                    onPressed: () {},
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      Constants.REGISTER,
                      style: TextStyle(color: Constants.COLORS['dark_gray']),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
