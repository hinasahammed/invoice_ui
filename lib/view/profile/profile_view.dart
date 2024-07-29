import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/view/editProfile/edit_profile_view.dart';
import 'package:invoice_ui/view/login/login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const EditProfileView()));
            },
            icon: const Icon(Icons.edit_calendar_outlined),
          ),
          const Gap(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .32,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xff0f0f0f),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "David",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "david012@gmail.com",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color:
                                  theme.colorScheme.secondary.withOpacity(.3),
                            ),
                          ),
                          const Gap(20),
                          Text(
                            "Contact",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "7895789456",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color:
                                  theme.colorScheme.secondary.withOpacity(.3),
                            ),
                          ),
                          const Gap(30),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff040404),
                              ),
                              icon: Icon(
                                Icons.logout,
                                color: theme.colorScheme.error,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginView(),
                                    ));
                              },
                              label: Text(
                                "Logout",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 100,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff111318),
                      image: const DecorationImage(
                        image: AssetImage(ImageAsset.profile),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
