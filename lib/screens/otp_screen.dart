import 'package:flutter/material.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  final Function onOtpVerified;

  OtpVerificationScreen({required this.onOtpVerified, required String phone});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _otpController = TextEditingController();
  bool isButtonDisabled = true;
  int countdown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        setState(() {
          isButtonDisabled = false;
        });
        _timer?.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      countdown = 30;
      isButtonDisabled = true;
    });
    _startCountdown();
    // TODO: Replace with real resend code logic
    print("Mock: Resending code...");
  }

  void _verifyCode() {
    if (_otpController.text.trim() == "123456") {
      widget.onOtpVerified();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid code")),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 61, 16),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the 6-digit code",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterText: '',
                hintText: "123456",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verifyCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 133, 186, 135),
              ),
              child: Text("Verify"),
            ),
            SizedBox(height: 20),
            Text(
              isButtonDisabled
                  ? "Resend code in 00:${countdown.toString().padLeft(2, '0')}"
                  : "Didn't receive it?",
              style: TextStyle(color: Colors.white70),
            ),
            if (!isButtonDisabled)
              TextButton(
                onPressed: _resendCode,
                child: Text("Resend Code"),
              )
          ],
        ),
      ),
    );
  }
}
