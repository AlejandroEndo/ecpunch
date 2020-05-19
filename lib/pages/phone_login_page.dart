import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecpunch/providers/login_state.dart';
import 'package:ecpunch/widgets/login_button.dart';
import 'package:ecpunch/widgets/principal_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:provider/provider.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  _PhoneLoginPageState createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  String phone;
  String countryCode = '+57';
  Provider loginState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              PrincipalHeader(),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        Constants.PHONE_LOGIN_TITLE,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: CountryCodePicker(
                            initialSelection: 'CO',
                            favorite: ['+57', 'CO'],
                            onChanged: (CountryCode code) {
                              countryCode = code.dialCode;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            onChanged: (String value) {
                              phone = value;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: Constants.PHONE_HINT,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    LoginButton(
                      type: 'sms',
                      onPressed: () async {
                        Navigator.of(context).pushNamed('/phoneCode');
                        // context
                        //     .read<LoginState>()
                        //     .verifyPhoneNumber('$countryCode$phone', context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
