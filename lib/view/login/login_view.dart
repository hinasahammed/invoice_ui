import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';
import 'package:invoice_ui/res/components/common/custom_textformfield.dart';
import 'package:invoice_ui/view/register/register_view.dart';
import 'package:invoice_ui/viewModel/services/login/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isRemember = false;

  @override
  void initState() {
    super.initState();
    isStoredloginData();
  }

  void isStoredloginData() async {
    final pref = await SharedPreferences.getInstance();
    var user = pref.getString("isRememberUserName");
    var password = pref.getString("isRememberPassword");
          userNameController.text = user ?? '';
          passwordController.text = password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Icon(
            Icons.language,
            color: theme.colorScheme.primary,
          ),
          const Gap(10),
          const Text("English"),
          const Gap(10),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAsset.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Login to your account",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(.4),
                  ),
                ),
                const Gap(20),
                CustomTextformfield(
                  controller: userNameController,
                  prefixIcon: Icons.person_2_outlined,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  label: "Username",
                ),
                CustomTextformfield(
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  suffixIcon: Icons.visibility_outlined,
                  label: "Password",
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CheckboxMenuButton(
                      value: isRemember,
                      onChanged: (value) {
                        setState(() {
                          isRemember = value!;
                        });
                      },
                      child: const Text(
                        'Remember me',
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget password?",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      LoginViewmodel().login(
                        userNameController.text.trim(),
                        passwordController.text.trim(),
                        context,
                        isRemember,
                      );
                    },
                    btnTitle: "Login",
                  ),
                ),
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const RegisterView(),
                          ),
                        );
                      },
                      child: Text(
                        "Signup",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
