import 'package:flutter/material.dart';
import 'package:invoice_ui/res/utils/theme.dart';
import 'package:invoice_ui/view/splash/splash_view.dart';
import 'package:invoice_ui/viewModel/profile/language_viewmodel.dart';
import 'package:invoice_ui/viewModel/services/profile/profile_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ProfileViewmodel().getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageViemodel(),
      child: ValueListenableBuilder(
        valueListenable: MyThemes.isDark,
        builder: (context, value, child) => MaterialApp(
          title: 'Invoice',
          debugShowCheckedModeBanner: false,
          theme: value ? MyThemes.darkThemeData : MyThemes.appThemeData,
          home: const SplashView(),
        ),
      ),
    );
  }
}
