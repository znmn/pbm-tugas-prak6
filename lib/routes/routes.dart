import 'package:flutter/material.dart';
import 'package:tugas_pbm/views/login/login.dart';
import 'package:tugas_pbm/views/register/register.dart';
import 'package:tugas_pbm/views/home/home.dart';

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static final mapping = <String, WidgetBuilder>{
    login: (context) => const LoginWidget(),
    register: (context) => const RegisterWidget(),
    home: (context) => const HomeWidget(),
  };
}
