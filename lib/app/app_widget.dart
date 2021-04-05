import 'package:flutter/material.dart';
import 'package:todo/app/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoFlutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.black,
        )),
        primaryIconTheme: const IconThemeData.fallback().copyWith(
          color: Colors.black,
        ),
      ),
      home: SplashPage(),
    );
  }
}
