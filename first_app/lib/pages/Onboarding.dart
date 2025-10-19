import 'package:first_app/service/widget_support.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Image.asset("assets/images/onboard.png"),
            SizedBox(height: 20.0),
            Text(
              "The Fastest\n Food Delivery",
              textAlign: TextAlign.center,
              style: AppWidget.HeadLineTextFieldStyle(),
            ),

            SizedBox(height: 30),

            Text(
              'Craving something delicious?\n  Order now and get your favourite dish delivered',
              textAlign: TextAlign.center,
              style: AppWidget.simpleTextFieldStyle(),
            ),
            SizedBox(height: 30),
            Container(
              height: 60,

              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: Color(0xff8c592a),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
