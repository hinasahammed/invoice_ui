import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';
import 'package:invoice_ui/res/components/common/custom_textformfield.dart';
import 'package:invoice_ui/view/login/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAsset.background),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                "Register to your account",
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
                label: "Username", controller: null,
              ),
              CustomTextformfield(
                prefixIcon: Icons.mail_outline,
                borderRadius: BorderRadius.circular(0),
                label: "Email", controller: null,
              ),
              CustomTextformfield(
                prefixIcon: Icons.phone,
                borderRadius: BorderRadius.circular(0),
                label: "Phone", controller: null,
              ),
              const CustomTextformfield(
                prefixIcon: Icons.lock,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                suffixIcon: Icons.visibility_outlined,
                label: "Password", controller: null,
              ),
              const Gap(50),
              SizedBox(
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const LoginView(),
                      ),
                    );
                  },
                  btnTitle: "Sign up",
                ),
              ),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alredy have an account",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const LoginView(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
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
