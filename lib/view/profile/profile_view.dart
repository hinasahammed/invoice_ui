import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';
import 'package:invoice_ui/view/editProfile/edit_profile_view.dart';
import 'package:invoice_ui/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '';
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    final pref = await SharedPreferences.getInstance();
    var user = pref.getString("loginUserName");
    setState(() {
      userName = user ?? '';
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
                            userName,
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
                                backgroundColor:
                                    const Color.fromARGB(255, 19, 19, 19),
                              ),
                              icon: Icon(
                                Icons.logout,
                                color: theme.colorScheme.error,
                              ),
                              onPressed: () {
                                logout();
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
                  top: -40,
                  left: 100,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogedin", false).then(
          (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              )),
        );
  }
}
