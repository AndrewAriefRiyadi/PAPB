// bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.door_back_door),
          label: 'Kamar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Penghuni',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments),
          label: 'Pembayaran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_down_alt_rounded),
          label: 'Keluhan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Logs',
        ),
      ],
      backgroundColor: AppColors.primaryColor,
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColors.accentColor,
      onTap: onItemTapped,
    );
  }
}
