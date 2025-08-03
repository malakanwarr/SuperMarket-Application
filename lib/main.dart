import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/main_screen.dart'; // ✅ import your MainScreen, not just HomeScreen
import 'screens/login_screen.dart'; // import your login screen

void main() {
  runApp(SupermarketApp());
}

class SupermarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supermarket App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => PhoneLoginScreen(),
        '/home': (context) => MainScreen(), // ✅ show MainScreen instead of HomeScreen
      },
    );
  }
}
