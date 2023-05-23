import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(router.location.toString()),
            ElevatedButton(
              onPressed: () {
                context.go('/favorite');
              },
              child: const Text("Next Page"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/profile');
              },
              child: const Text("Profile Page"),
            ),
          ],
        ),
      ),
    );
  }
}
