import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class SplashController {
  ValueNotifier<bool> initialized = ValueNotifier(false);
  ValueNotifier<bool> error = ValueNotifier(false);

  void inicializeFirebase() async {
    try {
      await Firebase.initializeApp();
      Timer(
        Duration(seconds: 1),
        () {
          initialized.value = true;
        },
      );
    } catch (e) {
      error.value = true;
    }
  }
}
