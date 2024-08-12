import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harrytask/Components/button.dart';
import 'package:harrytask/Components/colors.dart';
import 'package:harrytask/Components/constants.dart';
import 'package:harrytask/Components/textfield.dart';
import 'package:harrytask/JSON/users.dart';
import 'package:harrytask/Views/login.dart';
import 'package:lottie/lottie.dart';

import '../SQLite/database_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //Controllers
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();
  signUp() async {
    var res = await db.createUser(Users(
        fullName: fullName.text,
        email: email.text,
        usrName: usrName.text,
        password: password.text));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register New Account",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: Constants.px20,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Lottie.asset('assets/lottie/signup.json',
                      height: Constants.px180, fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                InputField(
                    hint: "Full name",
                    icon: Icons.person,
                    controller: fullName),
                InputField(hint: "Email", icon: Icons.email, controller: email),
                InputField(
                    hint: "Username",
                    icon: Icons.account_circle,
                    controller: usrName),
                InputField(
                    hint: "Password",
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true),
                InputField(
                    hint: "Re-enter password",
                    icon: Icons.lock,
                    controller: confirmPassword,
                    passwordInvisible: true),
                const SizedBox(height: 10),
                Button(
                    label: "SIGN UP",
                    press: () {
                      signUp();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text("LOGIN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
