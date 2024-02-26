import 'dart:async';
import 'package:alikay_shop/screens/splash_screen/welome_screen.dart';
import 'package:alikay_shop/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home_screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  void navigateUser() {
    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()),);
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const WelcomeScreen()),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('${AppConstants.assetsAnimations}alikay_shop_splash_screen.json'),
      ),
    );
  }
}
