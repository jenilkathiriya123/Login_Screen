import 'package:flutter/material.dart';
import 'package:share_prefs/views/screen/home.dart';
import 'package:share_prefs/views/screen/login.dart';
import 'package:share_prefs/views/screen/sign.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool('isLogin') ?? false;
  bool? issign = prefs.getBool('issign') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        'login': (context) => login(),
        'sign': (context) => sign(),
      },
      initialRoute: (isLogin == true)
          ? "sign"
          : (issign == true)
              ? "/"
              : "login",
    ),
  );
}
