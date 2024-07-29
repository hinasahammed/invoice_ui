import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';
import 'package:invoice_ui/res/components/common/custom_textformfield.dart';
import 'package:invoice_ui/view/profile/profile_view.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Update",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
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
              CustomTextformfield(
                prefixIcon: Icons.mail_outline,
                borderRadius: BorderRadius.circular(0),
                label: "Email",
              ),
              const CustomTextformfield(
                prefixIcon: Icons.phone,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                label: "Phone",
              ),
              const Gap(50),
              SizedBox(
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ProfileView(),
                      ),
                    );
                  },
                  btnTitle: "Update",
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
