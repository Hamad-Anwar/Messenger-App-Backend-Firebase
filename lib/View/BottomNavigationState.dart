import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/View/HomePage/home_page.dart';
import 'package:messenger/View/Search/search_users.dart';

import 'HomePage/floating_button.dart';

class BottomNavigationState extends StatefulWidget {
  const BottomNavigationState({super.key});

  @override
  State<BottomNavigationState> createState() => _BottomNavigationStateState();
}

class _BottomNavigationStateState extends State<BottomNavigationState> {
  int currentIndex=0;
  Widget screen=HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons:  const [
          Icons.home_max_outlined,
          CupertinoIcons.search,
          Icons.favorite_border,
          Icons.person_2_outlined,
        ],
        height: 60,
        backgroundColor: Colors.white,
        inactiveColor: Colors.black,
        activeIndex: currentIndex,
        activeColor: Colors.deepOrange,
        elevation: 20,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (p0) {
          currentIndex=p0;
          if(currentIndex==0){
            screen=HomePage();
          }else if(currentIndex==1){
            screen=const SearchUser();
          }
          setState(() {

          });
        },
      ),
        body: screen,
    );
  }
}
