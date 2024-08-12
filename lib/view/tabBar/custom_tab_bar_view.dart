import 'package:flutter/material.dart';
import 'package:invoice_ui/view/home/home_view.dart';
import 'package:invoice_ui/view/profile/profile_view.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List pages = [
      const HomeView(),
      const ProfileView(),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: theme.colorScheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: ''),
        ],
      ),
    );
  }
}
