import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futsal_book_app/views/Profile_Page.dart';
import 'package:futsal_book_app/views/Search_Page.dart';
import 'package:go_router/go_router.dart';

import '../cores/bottomNavGoRouter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        print(state.location);
        return NoTransitionPage(
            child: ScaffoldWithNavBar(
          location: state.location,
          child: child,
        ));
      },
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(child: Text("Home")),
              ),
            );
          },
        ),
        GoRoute(
          path: '/likes',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(child: Text("Likes")),
              ),
            );
          },
        ),
        GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/profile',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ProfilePage());
            }),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/search',
      pageBuilder: (context, state) {
        return NoTransitionPage(key: UniqueKey(), child: const SearchPage());
      },
    ),
  ],
);
