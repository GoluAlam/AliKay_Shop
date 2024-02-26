import 'package:flutter/material.dart';
import '../account_screens/account_screen.dart';
import '../add_to_cart/add_to_cart.dart';
import '../category_screens/category_screen.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const CategoryScreen(),
    const AddToCart(),
    const AccountScreen(),

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.bodySmall!.fontSize!,
        unselectedFontSize: textTheme.bodySmall!.fontSize!,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize_outlined),
              label: '',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '',
              backgroundColor: Colors.grey),
        ],
      ),
    );
  }
}








