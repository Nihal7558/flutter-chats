import 'package:chats/auth/signin_page.dart';
import 'package:chats/model/service/firebase_services.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confrimpasswordontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 90,
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "enter your email"),
                validator: (value) {
                  if (emailcontroller.text.isEmpty) {
                    return "enter an email id";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Password"),
                validator: (value) {
                  if (passwordcontroller.text.isEmpty) {
                    return "enter an password";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: confrimpasswordontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Confrim Password"),
                validator: (value) {
                  if (confrimpasswordontroller.text.isEmpty) {
                    return "re-enter an password";
                  } else if (passwordcontroller != confrimpasswordontroller) {
                    return "password doesn't match";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 55,
                width: 340,
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseServices().createUser(
                          emailcontroller.text, passwordcontroller.text);
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text(
                      "Signup",
                      style: TextStyle(fontSize: 20),
                    ))),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((_) => SigninPage())));
                    },
                    child: Text(
                      "Login now",
                      style: TextStyle(fontSize: 17),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
