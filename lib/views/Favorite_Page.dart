import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Page")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(router.location.toString()),
          ElevatedButton(onPressed: () {}, child: const Text("Next Page"))
        ],
      )),
    );
  }
}
