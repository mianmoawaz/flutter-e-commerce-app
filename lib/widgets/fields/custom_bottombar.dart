import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/user/add_tocart.dart';
import 'package:flutter_e_commece_app/user/home_screen.dart';
import 'package:flutter_e_commece_app/user/search.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'dart:async';

class CustomBottombar extends StatefulWidget {
  final int selectedIndex;
  const CustomBottombar({super.key, this.selectedIndex = 0});

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  late int _currentIndex;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    _streamController.add(_currentIndex);
  }

  final List<Widget> _screens = [
    HomeScreen(),
    SearchProductScreen(),
    const AddTocart(),
  ];

  void _changeIndex(int index) {
    _currentIndex = index;
    _streamController.add(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: _streamController.stream,
        initialData: _currentIndex,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _screens[snapshot.data!];
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
