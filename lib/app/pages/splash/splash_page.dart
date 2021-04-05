import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/pages/home/home_page.dart';
import 'package:todo/app/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.inicializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            builder: (_, __, ___) {
              if (controller.initialized.value) {
                _redirectToHome();
                return Text('FireBase Inicializado');
              } else {
                return CircularProgressIndicator();
              }
            },
            valueListenable: controller.initialized,
          ),
          ValueListenableBuilder(
            builder: (_, __, ___) {
              if (controller.error.value) {
                return Text('Erro ao inicialiar o firebase');
              } else {
                return Container(height: 0);
              }
            },
            valueListenable: controller.error,
          ),
        ],
      ),
    ));
  }

  void _redirectToHome() {
    Timer(Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return HomePage();
        },
      ));
    });
  }
}
