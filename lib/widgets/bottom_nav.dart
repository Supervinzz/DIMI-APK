import 'package:flutter/material.dart';

class DimiBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const DimiBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Beranda'),
        NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'Pesanan'),
        NavigationDestination(icon: Icon(Icons.restaurant_menu_outlined), label: 'Menu'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}
