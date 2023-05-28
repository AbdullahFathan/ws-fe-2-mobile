import 'package:flutter/material.dart';
import 'package:ws2/screens/home_page.dart';
import 'package:ws2/screens/register_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (contex) => const RegisterPage(),
  "/homePage": (contex) => const HomePage(),
};
