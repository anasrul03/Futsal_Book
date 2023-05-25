import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futsal_book_app/routes/app_route.dart';
import 'package:futsal_book_app/views/Error_Page.dart';
import 'package:futsal_book_app/views/Favorite_Page.dart';
import 'package:futsal_book_app/views/Home_Page.dart';
import 'package:futsal_book_app/views/Profile_Page.dart';
import 'package:futsal_book_app/views/Promotion_page.dart';
import 'package:go_router/go_router.dart';
import 'package:futsal_book_app/views/container_transition.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
