import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFeild extends StatefulWidget {
  const PinCodeFeild({Key? key}) : super(key: key);

  @override
  _PinCodeFeildState createState() => _PinCodeFeildState();
}

class _PinCodeFeildState extends State<PinCodeFeild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinCodeFeild'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.teal,
                  obscureText: true,
                  obscuringCharacter: '*',
                  pinTheme: PinTheme(
                      // shape: PinCodeFieldShape.circle
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.teal.shade600,
                      inactiveFillColor: Colors.orange.shade600,
                      selectedFillColor: Colors.red,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.green,
                      activeColor: Colors.purple),
                  onChanged: (value) {}),
            ),
          )
        ],
      ),
    );
  }
}
