import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key, this.name, this.age, this.email});
  String? name;
  String? age;
  String? email;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController emailController = TextEditingController();
  bool value = false;
  String? firstname;
  String? firstemail;
  String? firstage;
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("$firstname"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                getData();
                setState(() {
                  value = true;
                });
              },
              child: Text("view Button")),
          value == true
              ? Row(
                  children: [
                    Text(
                      "Name:${widget.name.toString()}",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Age: ${widget.age.toString()}",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Email: ${widget.email.toString()}",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstname = prefs.getString('countername');
    firstage = prefs.getString('counterage');
    firstemail = prefs.getString('countereail');
  }
}
