import 'package:flutter/material.dart';
import 'package:invoice_ui/view/tabBar/custom_tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewmodel {
   void login(String userName,BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("loginUserName", userName);
    pref.setBool("isLogedin", true).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const CustomTabBarView(),
            ),
          ),
        );
  }
}