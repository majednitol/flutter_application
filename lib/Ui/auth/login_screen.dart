import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Ui/Widget/rounded_button.dart';
import 'package:flutter_application/Ui/auth/signup_screen.dart';
import 'package:flutter_application/Ui/utils.dart';
import 'package:flutter_application/Ui/posts/posts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool isLoading = false;
  void isLoging() {
    setState(() {
      isLoading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailEditingController.text.toString(),
            password: passwordEditingController.text.toString())
        .then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Posts(),
          ));
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      Utils().toast(error.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginScreen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        controller: emailEditingController,
                        decoration: const InputDecoration(
                            hintText: "Email address",
                            prefixIcon: Icon(Icons.email)),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        controller: passwordEditingController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined)),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        }),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: RoundedButton(
                    title: "login",
                    isLoading: isLoading,
                    onTap: (() {
                      if (_formkey.currentState!.validate()) {
                        isLoging();
                      }
                    }))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Don't have a  account"),
                TextButton(
                  child: const Text("sign up"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SignupScreen())));
                  },
                )
              ],
            )
          ],
        ));
  }
}
