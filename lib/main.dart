import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/login.dart';
import 'package:user/pages/home.dart';
import 'package:user/pages/testpage.dart';

import 'customer/pages/storespage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool loggedIn = prefs.getBool('loggedIn') ?? false;
  final String userType = prefs.getString('userType') ?? '';

  await Hive.initFlutter();
  await Hive.openBox('_orders');
  await Firebase.initializeApp();

  Widget homeScreen;
  if (loggedIn) {
    if (userType == 'customer') {
      homeScreen = StorePage();
    } else if (userType == 'entrep') {
      homeScreen = HomePage();
    } else {
      // Handle unknown user type or other conditions
      homeScreen = LoginPage();
    }
  } else {
    homeScreen = LoginPage();
  }
  runApp(MyApp(homeScreen: homeScreen));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.homeScreen});
  final Widget homeScreen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homeScreen,
      // home: const TestPage(),
    );
  }
}
