import 'package:flutter/material.dart';

class UndefinedScreen extends StatefulWidget {
  const UndefinedScreen({
    super.key,
  });

  @override
  State<UndefinedScreen> createState() => _UndefinedScreenState();
}

class _UndefinedScreenState extends State<UndefinedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("404 NOT FOUND"),
          ],
        ),
      ),
    );
  }
}
