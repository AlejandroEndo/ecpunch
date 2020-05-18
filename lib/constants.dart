library constants;

import 'package:flutter/material.dart';

const String FORGOT_PASSWORD = '¿Ha olvidado la contraseña?';
const String REGISTER = '¿No tienes una cuenta?';

const String CONNECT = 'Connect with';
const Map<String, String> LOGIN = {
  'google': '$CONNECT Google',
  'facebook': '$CONNECT Facebook',
  'phone': '$CONNECT Phone',
  'login': 'Log In user and pass',
};

const Map<String, Color> COLORS = {
  'google': Color(0xff686e80),
  'facebook': Color(0xff1476bd),
  'phone': Color(0xffa5bf37),
  'login': Color(0xfff15b22),
};

const Map<String, String> HEADERS = {"Content-Type": "application/json"};
