import 'package:flutter/material.dart';
import 'package:harrytask/withdatabase/databse_helper.dart';
import 'package:harrytask/withdatabase/user_model.dart';

class AddDataScreen extends StatelessWidget {
  final Crud? crud;

  const AddDataScreen({Key? key, this.crud}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final emailController = TextEditingController();

    if (crud != null) {
      nameController.text = crud!.name;

      emailController.text = crud!.email;

      ageController.text = crud!.age;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(crud == null ? 'Add a data' : 'Edit data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  'Add Data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                controller: nameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Type here',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: 'Type here',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
                keyboardType: TextInputType.multiline,
                onChanged: (str) {},
              ),
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                  hintText: 'Type here',
                  labelText: 'Age',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final name = nameController.value.text;

                      final email = emailController.value.text;

                      final age = ageController.value.text;

                      if (name.isEmpty || email.isEmpty || age.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text('All fields are mandatory to field'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      final Crud model = Crud(
                          name: name, email: email, id: crud?.id, age: age);

                      if (crud == null) {
                        await DatabaseHelper.addData(model);
                      } else {
                        await DatabaseHelper.updateData(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text(
                      crud == null ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
