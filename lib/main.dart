import 'package:flutter/material.dart';
import 'package:invoice_ui/view/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0E75F4),
          brightness: Brightness.dark,
          primary: const Color(0xff0E75F4),
          onPrimary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
