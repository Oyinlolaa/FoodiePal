import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodie_pal/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _timerSeconds = 15;

  @override
  void initState() {
    super.initState();
    // Start the timer
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
          // Redirect to the login page after the countdown
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Food icons
            Icon(
              Icons.local_dining,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'FOODIEPAL',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'YourFont', // Replace with your preferred font
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Culinary Adventure Awaits!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                // Add additional styling as needed
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Launching in $_timerSeconds seconds',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                // Add additional styling as needed
              ),
            ),
            // You can add more design elements as desired
          ],
        ),
      ),
    );
  }
}
