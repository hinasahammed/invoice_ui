import 'package:flutter/material.dart';
import 'package:invoice_ui/view/login/login_view.dart';
import 'package:invoice_ui/view/tabBar/custom_tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewmodel {
  void isLogin(
    BuildContext context,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getBool("isLogedin");
    if (val != null) {
      if (val) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomTabBarView(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        }
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      }
    }
  }
}
