import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home Page"),
          ElevatedButton(
              onPressed: () {
                context.go('/favorite');
              },
              child: const Text("Next Page"))
        ],
      ),
    );
  }
}
