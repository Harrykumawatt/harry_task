import 'package:flutter/material.dart';
import 'package:indian_currency_to_word/indian_currency_to_word.dart';

class ConvertNumber extends StatefulWidget {
  const ConvertNumber({super.key});

  @override
  State<ConvertNumber> createState() => _ConvertNumberState();
}

class _ConvertNumberState extends State<ConvertNumber> {
  final converter = AmountToWords();
  var word;
  var number = 555.05;
  TextEditingController currencyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: currencyController,
            decoration: InputDecoration(hintText: "Currency"),
          ),
          ElevatedButton(
              onPressed: () {
                word = converter.convertAmountToWords(number);
              },
              child: Text("data")),
          Text("$word")
        ],
      ),
    );
  }
}
