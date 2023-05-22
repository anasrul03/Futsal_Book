import 'package:flutter/material.dart';
import 'package:futsal_book_app/pages/login_page.dart';
import 'package:futsal_book_app/pages/undefined.dart';
import 'package:futsal_book_app/route/app_route_name.dart';

import '../pages/home_screen.dart';

Route<dynamic>? generate(RouteSettings settings) {
  switch (settings.name) {
    case HomePageView:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case LoginPageView:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default:
  }
  return MaterialPageRoute(builder: (context) => const UndefinedScreen());
}
