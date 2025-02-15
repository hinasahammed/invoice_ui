import 'package:flutter/material.dart';
import 'package:invoice_ui/res/utils/utils.dart';
import 'package:invoice_ui/view/tabBar/custom_tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewmodel {
  void login(
    String userName,
    String password,
    BuildContext context,
    bool isRemeber,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var name = pref.getString("userName");
    var pass = pref.getString("password");

    if (name == null || pass == null) {
      if (context.mounted) {
        Utils().showFlushToast(context, "Error", "Try to create account");
      }
    } else if (userName != name || password != pass) {
      if (context.mounted) {
        Utils()
            .showFlushToast(context, "Error", "Incorrect password or username");
      }
    } else if (name == userName && pass == password) {
      if (isRemeber) {
        pref.setString("isRememberUserName", userName);
        pref.setString("isRememberPassword", pass);
      }
      pref.setBool("isLogedin", true);
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const CustomTabBarView(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        Utils().showFlushToast(context, "Error", "Something went wrong!");
      }
    }
  }
}
