import 'package:flutter/material.dart';

class SecondaryHeader extends StatefulWidget {
  @override
  _SecondaryHeaderState createState() => _SecondaryHeaderState();
}

class _SecondaryHeaderState extends State<SecondaryHeader> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
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
          Positioned(
            bottom: 30.0,
            left: 30.0,
            child: Container(
              width: (MediaQuery.of(context).size.width / 5) * 3,
              child: Image.asset('assets/images/logo-blanco.png'),
            ),
          ),
        ],
      ),
    );
  }
}