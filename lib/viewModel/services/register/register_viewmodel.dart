import 'package:flutter/material.dart';
import 'package:invoice_ui/res/utils/utils.dart';
import 'package:invoice_ui/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterViewmodel {
  void register(
    String username,
    String email,
    String contact,
    String password,
    BuildContext context,
  ) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("userName", username);
    await pref.setString("email", email);
    await pref.setString("contact", contact);
    await pref.setString("password", password).then(
      (value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
        Utils().showFlushToast(
          context,
          "Success",
          "Account created sucessfully, try to login",
        );
      },
    );
  }
}
