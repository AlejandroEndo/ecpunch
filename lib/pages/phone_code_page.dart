import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecpunch/widgets/secondary_header.dart';
import 'package:flutter/material.dart';
import 'package:ecpunch/constants.dart' as Constants;
import 'package:pin_input_text_field/pin_input_text_field.dart';

class PhoneCodePage extends StatefulWidget {
  @override
  _PhoneCodePageState createState() => _PhoneCodePageState();
}

class _PhoneCodePageState extends State<PhoneCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SecondaryHeader(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Constants.PHONE_CODE_TITLE,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    Constants.PHONE_CODE_SUBTITLE,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      CountryCodePicker(
                        initialSelection: 'CO',
                        favorite: ['+57', 'CO'],
                        enabled: false,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '3207065260',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
                      child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      Constants.PHONE_CODE_CONTENT,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  PinInputTextField(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
