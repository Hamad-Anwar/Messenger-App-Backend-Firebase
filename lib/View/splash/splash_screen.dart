import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/Data/Netword/Firebase/firebase_services.dart';
import 'package:messenger/View/BottomNavigationState.dart';
import 'package:messenger/res/Assets/image_assets.dart';
import 'package:get/get.dart';

import '../account/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Timer(const Duration(milliseconds: 2000), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.to(() => const BottomNavigationState());
      } else {
        Get.to(SignUp());
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FirebaseService.setStatusOnline();
    }
    if(state==AppLifecycleState.paused){
      FirebaseService.setStatusOffline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.splashImage,
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
