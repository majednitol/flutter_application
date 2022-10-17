import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Ui/Widget/rounded_button.dart';
import 'package:flutter_application/Ui/auth/login_screen.dart';
import 'package:flutter_application/Ui/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // je page a achi.. sekhan theke direct app theke ber haoyar jnno  WillPopScope widget use kora hoy
    return WillPopScope(
      onWillPop: (() async {
        SystemNavigator.pop();
        return true;
      }),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SignupScreen'),
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
                      title: "Sign up",
                      isLoading: isLoading,
                      onTap: (() {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailEditingController.text.toString(),
                                  password:
                                      passwordEditingController.text.toString())
                              .then((value) {
                            setState(() {
                              Utils().toast("Account successfully created");
                              isLoading = false;
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              isLoading = false;
                            });
                            Utils().toast(error.toString());
                          });
                        }
                      }))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Do you have already  account"),
                  TextButton(
                    child: const Text("Login"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginScreen())));
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
