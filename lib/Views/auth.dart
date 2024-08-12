import 'package:flutter/material.dart';
import 'package:harrytask/Components/button.dart';
import 'package:harrytask/Components/colors.dart';
import 'package:harrytask/Components/constants.dart';
import 'package:harrytask/Views/login.dart';
import 'package:harrytask/Views/signup.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Constants.px40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome  to Dr. Farrah's Lifestyle Coaching Consultation",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Constants.px25,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constants.appFonts,
                    color: primaryColor),
              ),
              // const Text(
              //   "Enter your vital information",
              //   style: TextStyle(color: Colors.grey),
              // ),
              Expanded(child: Lottie.asset("assets/lottie/home.json")
                  //   Image.asset("assets/startup.jpg"),
                  ),
              Button(
                  label: "LOGIN",
                  press: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  }),
              Button(
                  label: "SIGN UP",
                  press: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
