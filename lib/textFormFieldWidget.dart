import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormFieldWidget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              enabled: true,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: const Icon(Icons.visibility),
                  fillColor: Colors.grey.withOpacity(0.5),
                  filled: true,
                  hintText: "Email address",
                  labelText: "Email ",
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.blue.shade300)),
              onChanged: (value) => {print(value)},
            ),
          ),
        ],
      ),
    );
  }
}
