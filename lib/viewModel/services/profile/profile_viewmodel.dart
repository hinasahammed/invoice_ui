import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:invoice_ui/res/utils/theme.dart';
import 'package:invoice_ui/view/login/login_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewmodel {
  void logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogedin", false).then(
          (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              )),
        );
  }

  void logoutDialogue(
    BuildContext context,
  ) {
    AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      btnOkColor: Colors.deepPurple,
      dialogType: DialogType.question,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        logout(context);
      },
      btnCancelText: "Cancel",
      btnOkText: "Logout",
      autoDismiss: true,
      desc: "Are you want to logout?",
      title: "Logout",
    ).show();
  }

  void getTheme() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getBool("isDarkmode") ?? true;
    MyThemes.isDark.value = val;
  }

  void setTheme(bool value) async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool("isDarkmode", value);
  }

  
}
