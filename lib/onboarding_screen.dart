import 'package:burger_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox(
            height: screenHeight * 0.8,
            child: Image.asset('assets/onboarding_burger_image.jpg',
                fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.55),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(500, 150),
                  topRight: Radius.elliptical(500, 150)),
            ),
          ),
          // Overlay text
          Positioned(
            bottom: 150,
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Text(
                    "The Fastest in",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Food",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Our jo is to filling your tummy with\ndelicious food and fast delivery.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          // "Get Started" Button
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff14748)),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
