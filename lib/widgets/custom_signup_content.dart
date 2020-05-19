import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:provider/provider.dart';
import '../providers/login_state.dart';
import '../providers/login_state.dart';
import 'login_button.dart';

class CustomSignUpContent extends StatefulWidget {
  @override
  _CustomSignUpContentState createState() => _CustomSignUpContentState();
}

class _CustomSignUpContentState extends State<CustomSignUpContent> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Widget _inputField(String hintText, bool isEmail) {
      return TextFormField(
        validator: (String value) {
          if (value.isEmpty)
            return isEmail
                ? Constants.INVALID_EMAIL_FIELD
                : Constants.INVALID_PASSWORD_FIELD;
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (!emailValid && isEmail) return Constants.INVALID_EMAIL_FIELD;
          return null;
        },
        onSaved: (String value) {
          if (isEmail)
            email = value;
          else
            password = value;
        },
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
            key: formKey,
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
                _inputField(Constants.EMAIL_HINT, true),
                SizedBox(height: 40.0),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Constants.COLORS['soft_gray'],
                  ),
                ),
                _inputField(Constants.PASSWORD_HINT, false),
                SizedBox(height: 40.0),
                LoginButton(
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      Map<String, dynamic> result = await context
                          .read<LoginState>()
                          .signUp(email, password);
                      if (result['error']) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(result['message']),
                      ));
                      } else
                        Navigator.of(context).pop();
                    }
                  },
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
