library constants;

import 'package:flutter/material.dart';

// LOGIN
const String FORGOT_PASSWORD = '¿Ha olvidado la contraseña?';
const String REGISTER = '¿No tienes una cuenta?';
const String CONNECT = 'Connect with';
const Map<String, String> LOGIN = {
  'google': '$CONNECT Google',
  'facebook': '$CONNECT Facebook',
  'phone': '$CONNECT Phone',
  'login': 'Log In user and pass',
  'signin': 'Sign in',
  'signup': 'Sign up',
};

// Custom LOGIN / SIGNUP
const String LOGIN_TAB = 'LOG IN';
const String SIGNUP_TAP = 'SIGN UP';
const String EMAIL_HINT = 'Ingresa tu email o celular';
const String PASSWORD_HINT = 'Enter your password';
const String SIGNUP_TITLE = 'Create an account';
const String SIGNUP_SUBTITLE = 'Join ecpunch!';
const String INVALID_EMAIL_FIELD = 'Por favor introduzca un Correo valido.';
const String INVALID_PASSWORD_FIELD = 'Por favor introduzca una Contraseña valida.';

const Map<String, String> HEADERS = {"Content-Type": "application/json"};

// Custom COLORS
const Map<String, Color> COLORS = {
  'google': Color(0xff686e80),
  'facebook': Color(0xff1476bd),
  'phone': Color(0xffa5bf37),
  'login': Color(0xfff15b22),
  'signin': Color(0xff003fc5),
  'signup': Color(0xff003fc5),
  'blue': Color(0xff536b8d),
  'soft_blue': Color(0xfff6f7f9),
  'soft_gray': Color(0xffcbcfd7),
  'dark_gray': Color(0xff505d6f),
};
