import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          path: '/discover',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(child: Text("Discover")),
              ),
            );
          },
        ),
        GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/shop',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Scaffold(
                  body: Center(child: Text("Shop")),
                ),
              );
            }),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          key: UniqueKey(),
          child: Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("Login"),
            ),
          ),
        );
      },
    ),
  ],
);
