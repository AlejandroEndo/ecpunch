import 'package:ecpunch/pages/custom_login_page.dart';
import 'package:ecpunch/providers/login_state.dart';
import 'package:ecpunch/widgets/forgot_password_button.dart';
import 'package:ecpunch/widgets/login_button.dart';
import 'package:ecpunch/widgets/principal_header.dart';
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
          PrincipalHeader(),
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
                    onPressed: () {
                      context.read<LoginState>().logiInFacebook();
                    },
                  ),
                  LoginButton(
                    type: 'phone',
                    icon: FontAwesomeIcons.phone,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/phoneLogin');
                    },
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CustomLoginPage(initialIndex: 1)));
                    },
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
