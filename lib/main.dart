import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Loteray App",
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    width: 50,
                    height: 50,
                    image: AssetImage("Assets/logo.png")),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Maintenance",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Box",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF97038)))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet  non \n mi port  auctor et magn  id elit fdf",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.black45,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        iconColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffF97038)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffF97038)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.black45,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black,
                        ),
                        iconColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffF97038)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffF97038)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                      color: const Color(0xffF97038),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color(0xffF97038),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
