import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/Error_Page.dart';
import '../views/Favorite_Page.dart';
import '../views/Home_Page.dart';
import '../views/Profile_Page.dart';
import '../views/Promotion_page.dart';

final GoRouter router = GoRouter(
  errorBuilder: (BuildContext context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'promotion',
          builder: (BuildContext context, GoRouterState state) =>
              const PromotionPage(),
        ),
        GoRoute(
          path: 'favorite',
          builder: (BuildContext context, GoRouterState state) =>
              const FavoritePage(),
        ),
      ],
    ),
    GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) =>
            const ProfilePage(),
        routes: <GoRoute>[
          // GoRoute(
          //   path: 'settings',
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const ProfilePage(),
          // ),
        ])
  ],
);
