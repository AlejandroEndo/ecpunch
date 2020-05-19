import 'package:ecpunch/widgets/custom_login_content.dart';
import 'package:ecpunch/widgets/custom_signup_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:ecpunch/providers/login_state.dart';

class CustomLoginPage extends StatefulWidget {
  @override
  _CustomLoginPageState createState() => _CustomLoginPageState();
}

class _CustomLoginPageState extends State<CustomLoginPage> {
  @override
  Widget build(BuildContext context) {
    final _header = Expanded(
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: <Widget>[
              _header,
              TabBar(
                indicatorColor: Constants.COLORS['facebook'],
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      Constants.LOGIN_TAB,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.COLORS['facebook'],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      Constants.SIGNUP_TAP,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.COLORS['facebook'],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(child: CustomLoginContent()),
                    SingleChildScrollView(child: CustomSignUpContent()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
