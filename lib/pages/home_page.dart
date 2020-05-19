import 'package:ecpunch/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.network(context.watch<LoginState>().user.photoUrl ?? ''),
            Text(context.watch<LoginState>().user.displayName ?? ''),
            Text(context.watch<LoginState>().user.email ?? ''),
            Text(context.watch<LoginState>().user.phoneNumber ?? ''),
            RaisedButton(
              onPressed: () async {
                context.read<LoginState>().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
