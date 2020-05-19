import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;

import 'login_button.dart';

class CustomSignUpContent extends StatefulWidget {
  @override
  _CustomSignUpContentState createState() => _CustomSignUpContentState();
}

class _CustomSignUpContentState extends State<CustomSignUpContent> {
  @override
  Widget build(BuildContext context) {
    Widget _inputDecoration(String hintText) {
      return TextFormField(
        decoration: InputDecoration(
          fillColor: Constants.COLORS['soft_blue'],
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Constants.COLORS['soft_gray'],
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Constants.COLORS['soft_blue'],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Constants.COLORS['soft_blue'],
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              Constants.SIGNUP_TITLE,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25.0,
                color: Constants.COLORS['blue'],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              Constants.SIGNUP_SUBTITLE,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Constants.COLORS['blue'],
              ),
            ),
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Constants.COLORS['soft_gray'],
                  ),
                ),
                _inputDecoration(Constants.EMAIL_HINT),
                SizedBox(height: 40.0),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Constants.COLORS['soft_gray'],
                  ),
                ),
                _inputDecoration(Constants.PASSWORD_HINT),
                SizedBox(height: 40.0),
                LoginButton(
                  onPressed: () {},
                  type: 'signup',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
