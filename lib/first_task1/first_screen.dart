import 'package:flutter/material.dart';
import 'package:harrytask/first_task1/second%20Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? name;
  String? age;
  String? email;
  String? namekk;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
              controller: nameController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Age",
                labelText: 'Age',
              ),
              controller: ageController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      ageController.text.isEmpty ||
                      emailController.text.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text('All fields are mandatory to field'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    saveData();
                    setState(() {
                      name = nameController.text;
                      age = ageController.text;
                      email = emailController.text;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen(
                                  age: age,
                                  name: name,
                                  email: email,
                                )));
                  }
                },
                child: Text("Second Screen ")),
            ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("check save")),
            Text("$namekk")
          ],
        ),
      ),
    );
  }

  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('countername', name.toString());
    prefs.setString('counterage', age.toString());
    prefs.setString('countereail', emailController.toString());
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namekk = prefs.getString('countername');
  }
}
