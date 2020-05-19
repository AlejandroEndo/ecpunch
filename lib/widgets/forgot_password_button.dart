import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;

class ForgotPasswordButton extends StatelessWidget {
  final Function onPressed;
  ForgotPasswordButton({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      child: Text(Constants.FORGOT_PASSWORD, style: TextStyle(color: Constants.COLORS['dark_gray']),),
      onPressed: onPressed,
    );
  }
}
