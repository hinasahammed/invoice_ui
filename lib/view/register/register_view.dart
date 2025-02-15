import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';
import 'package:invoice_ui/res/components/common/custom_textformfield.dart';
import 'package:invoice_ui/view/login/login_view.dart';
import 'package:invoice_ui/viewModel/services/register/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final conctactController = TextEditingController();
  final passwordController = TextEditingController();
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
                controller: emailController,
                prefixIcon: Icons.mail_outline,
                borderRadius: BorderRadius.circular(0),
                label: "Email",
              ),
              CustomTextformfield(
                controller: conctactController,
                prefixIcon: Icons.phone,
                borderRadius: BorderRadius.circular(0),
                label: "Phone",
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
              const Gap(50),
              SizedBox(
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    RegisterViewmodel().register(
                      userNameController.text.trim(),
                      emailController.text.trim(),
                      conctactController.text.trim(),
                      passwordController.text.trim(),
                      context,
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

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    conctactController.dispose();
    passwordController.dispose();
  }
}
