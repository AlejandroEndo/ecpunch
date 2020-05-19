import 'package:flutter/material.dart';

class PrincipalHeader extends StatefulWidget {
  @override
  _PrincipalHeaderState createState() => _PrincipalHeaderState();
}

class _PrincipalHeaderState extends State<PrincipalHeader> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
