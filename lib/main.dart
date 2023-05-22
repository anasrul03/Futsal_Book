import 'package:flutter/material.dart';
import 'package:futsal_book_app/pages/undefined.dart';
import 'package:futsal_book_app/route/app_route_name.dart';
import 'route/app_route.dart' as router;

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generate,
      initialRoute: HomePageView,
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const UndefinedScreen()),
    );
  }
}
