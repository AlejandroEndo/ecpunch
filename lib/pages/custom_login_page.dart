import 'package:ecpunch/widgets/custom_login_content.dart';
import 'package:ecpunch/widgets/custom_signup_content.dart';
import 'package:ecpunch/widgets/secondary_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:ecpunch/providers/login_state.dart';

class CustomLoginPage extends StatefulWidget {
  final int initialIndex;
  CustomLoginPage({Key key, this.initialIndex}) : super(key: key);
  @override
  _CustomLoginPageState createState() => _CustomLoginPageState();
}

class _CustomLoginPageState extends State<CustomLoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex ?? 0,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: <Widget>[
              SecondaryHeader(),
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
