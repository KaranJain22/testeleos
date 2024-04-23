// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

const borderWidth = 2.0;

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color(0xFF8f57e4),
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color(0xFF8f57e4),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Color(0xFF8f57e4)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color(0xFFECE0FF),
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(15.0),
        borderSide: const BorderSide(width: borderWidth, color: Colors.white),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(15.0),
        borderSide: const BorderSide(width: borderWidth, color: Colors.white),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:
              const BorderSide(width: borderWidth, color: Colors.white)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container useButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xFF8f57e4),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 200, 200, 200);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)))),
    ),
  );
}
