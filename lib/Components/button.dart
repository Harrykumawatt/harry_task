import 'package:flutter/material.dart';
import 'package:harrytask/Components/colors.dart';
import 'package:harrytask/Components/constants.dart';

//We are going to design our own button

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  const Button({super.key, required this.label, required this.press});

  @override
  Widget build(BuildContext context) {
    //Query width and height of device for being fit or responsive
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: size.width * .9,
      height: Constants.px50,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF0575E6),
            Color(0xFF021B79),
            // Color(0xFF24243e)
          ]),
          borderRadius: BorderRadius.circular(8)),
      child: TextButton(
        onPressed: press,
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontFamily: Constants.appFonts),
        ),
      ),
    );
  }
}
