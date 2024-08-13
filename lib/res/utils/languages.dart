import 'package:flutter/material.dart';

class Languages {
  static ValueNotifier<String> lang = ValueNotifier("English");

  Map<String, String> english = {
    "contact": "Contact",
    "logout": "Logout",
    "notification": "Notification",
    "dark": "Dark mode",
  };
  Map<String, String> malayalam = {
    "contact": "കോൺടാക്റ്റുകൾ",
    "logout": "പുറത്തുകടക്കുക",
    "notification": "അറിയിപ്പ്",
    "dark": "ഇരുണ്ട മോഡ്",

  };
}
