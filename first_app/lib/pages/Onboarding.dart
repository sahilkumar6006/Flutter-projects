import 'package:first_app/service/widget_support.dart';
import 'package:first_app/pages/home.dart'; 
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
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/onboard.png",
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 200,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "The Fastest\nFood Delivery",
              textAlign: TextAlign.center,
              style: AppWidget.HeadLineTextFieldStyle(),
            ),
            const SizedBox(height: 30),
            Text(
              'Craving something delicious?\nOrder now and get your favourite dish delivered',
              textAlign: TextAlign.center,
              style: AppWidget.simpleTextFieldStyle(),
            ),
            const SizedBox(height: 40),

            // ---------- Get Started Button ----------
            GestureDetector(
              onTap: () {
                // 👇 Navigate to Home screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: const Color(0xff8c592a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
