import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/view/login/login_view.dart';
import 'package:invoice_ui/view/tabBar/custom_tab_bar_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => isLogin(),
    );
  }

  void isLogin() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getBool("isLogedin");
    if (val != null) {
      if (val) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomTabBarView(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animations/wallet_animation.json",
            ),
            const Gap(20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
