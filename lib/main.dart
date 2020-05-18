import 'package:ecpunch/pages/home_page.dart';
import 'package:ecpunch/pages/login_page.dart';
import 'package:ecpunch/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (BuildContext context) => LoginState(),
      // builder: (BuildContext context){
      //   return LoginState(),
      // },
      // value: LoginState(),
      child: MaterialApp(
        title: 'ecpunch',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: LoginPage(),
        routes: {
          '/': (BuildContext context) {
            if (context.watch<LoginState>().isLoggedIn)
              return HomePage();
            else
              return LoginPage();
          }
        },
      ),
    );
  }
}
