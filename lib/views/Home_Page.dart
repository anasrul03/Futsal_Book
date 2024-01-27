import 'package:flutter/material.dart';
import 'package:futsal_book_app/cores/bottomNavGoRouter.dart';
import 'package:futsal_book_app/views/Favorite_Page.dart';
import 'package:futsal_book_app/views/Profile_Page.dart';
import 'package:futsal_book_app/views/Promotion_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Billion Dollar App')),
      body: ScaffoldWithNavBar(child: Text("data"), location: '/'),
    );
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return const Center(child: Text('Home'));
      case 1:
        return const Center(child: Text('Search'));
      case 2:
        return const Center(child: Text('Account'));
      default:
        return const Center(child: Text('Default'));
    }
  }
}
