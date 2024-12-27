import 'package:chats/auth/signup_page.dart';
import 'package:chats/model/service/firebase_services.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.lock,
                  size: 90,
                ),
                SizedBox(
                  height: 27,
                ),
                Text(
                  "Welcome back you've been missed!",
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
                        return "please enter your email id";
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
                        return "please enter your email id";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 220),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 55,
                    width: 340,
                    child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseServices().loginUser(
                              emailcontroller.text, passwordcontroller.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: Text(
                          "Signin",
                          style: TextStyle(fontSize: 20),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Text("------------------ OR continue with ------------------"),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await FirebaseServices().googleSignin();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: NetworkImage(
                            "https://imagepng.org/wp-content/uploads/2019/08/google-icon.png",
                            scale: 0.5,
                          ),
                          width: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: AssetImage(
                            "assets/apple.png",
                          ),
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "not a member?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((_) => SignupPage())));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 15),
                        ))
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
