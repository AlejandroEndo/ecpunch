import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatelessWidget {
  String type;
  IconData icon;
  Function onPressed;
  LoginButton({
    Key key,
    @required this.type,
    @required this.onPressed,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.0),
      child: RaisedButton(
        elevation: 0.0,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        color: Constants.COLORS[type],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon == null ? Container() : Icon(icon, color: Colors.white),
            SizedBox(width: 15.0),
            Text(
              Constants.LOGIN[type],
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
