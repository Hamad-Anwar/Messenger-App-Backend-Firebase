import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_max_outlined,
        Icons.save_alt,
        Icons.favorite_border,
        Icons.person_2_outlined,
      ],
      height: 60,
      backgroundColor: Colors.white,
      inactiveColor: Colors.black,
      activeIndex: 0,
      activeColor: Colors.deepOrange,
      elevation: 20,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      onTap: (p0) {
      },
    );
  }
}
