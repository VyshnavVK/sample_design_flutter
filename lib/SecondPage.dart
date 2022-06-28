import 'package:flutter/material.dart';
import 'package:sample_design/FlowerList.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    username.text = "";
    password.text = "";
  }

  void _showSnack(var text) {
    setState(() {
      var snackBar = SnackBar(
          content: Text(
            "$text",
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    Navigator.push(context, MaterialPageRoute(builder:(context) =>const FlowerList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Fill the data to below to login",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: username,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(hintText: "username"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: password,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                hintText: "password",
              ),
              obscureText: true,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, right: 30, left: 30, top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    if (username.text.isNotEmpty && password.text.isNotEmpty) {
                      _showSnack("Hi ${username.text}");
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
        ],
      ),
    );


  }
}
