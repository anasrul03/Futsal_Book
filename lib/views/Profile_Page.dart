import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(router.location.toString()),
          ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Next Page"))
        ],
      )),
    );
  }
}
