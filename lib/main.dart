import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xo_gamme/game_screen.dart';
import 'package:xo_gamme/register_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemStatusBarContrastEnforced: true));
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white, size: 30),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: registerScreen.routeName,
      routes: {
        registerScreen.routeName: (context) => registerScreen(),
        GameScreen.routeName: (context) => GameScreen(),
      },
    );
  }
}
