import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';
import 'package:invoice_ui/res/components/common/custom_textformfield.dart';
import 'package:invoice_ui/view/register/register_view.dart';
import 'package:invoice_ui/view/tabBar/custom_tab_bar_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: size.width,
          height: size.height,
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
              const CustomTextformfield(
                prefixIcon: Icons.person_2_outlined,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                label: "Username",
              ),
              const CustomTextformfield(
                prefixIcon: Icons.lock,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                suffixIcon: Icons.visibility_outlined,
                label: "Password",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CustomTabBarView(),
                      ),
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
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
