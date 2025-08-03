import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // simulate a splash screen delay (optional)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 61, 16),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '/Users/malakamr/supermarket_app/lib/assets/logo.png',
                width: 400,
                height: 400,
              ),
              SizedBox(height: 20),
              SpinKitThreeBounce(
              color: const Color.fromARGB(255, 133, 186, 135), // Customize the color
              size: 50.0,
            ),
            ],
          ),
        ),
      );
    } else {
      // After splash delay, show login screen
      return PhoneLoginScreen();

    }
  }
}
