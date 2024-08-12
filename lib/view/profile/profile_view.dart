import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/res/utils/theme.dart';
import 'package:invoice_ui/view/editProfile/edit_profile_view.dart';
import 'package:invoice_ui/viewModel/services/profile/profile_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '';
  String email = '';
  String contact = '';
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    final pref = await SharedPreferences.getInstance();
    var user = pref.getString("userName");
    var uEmail = pref.getString("email");
    var phone = pref.getString("contact");
    setState(() {
      userName = user ?? '';
      email = uEmail ?? '';
      contact = phone ?? '';
    });
  }

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
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .37,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            email,
                            style: theme.textTheme.labelLarge!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(.3),
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
                            "+91$contact",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(.3),
                            ),
                          ),
                          const Gap(30),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.onSurface,
                              ),
                              icon: Icon(
                                Icons.logout,
                                color: theme.colorScheme.surface,
                              ),
                              onPressed: () {
                                ProfileViewmodel().logoutDialogue(context);
                              },
                              label: Text(
                                "Logout",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.surface,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(ImageAsset.profile),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.notifications_active),
                title: const Text('Notifications'),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
            const Gap(10),
            Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
            const Gap(10),
            Card(
              child: SwitchListTile(
                value: MyThemes.isDark.value,
                onChanged: (value) {
                  MyThemes.isDark.value = value;
                  ProfileViewmodel().setTheme(value);
                },
                title: const Text("Dark mode"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
