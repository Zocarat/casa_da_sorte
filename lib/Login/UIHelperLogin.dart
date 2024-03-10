import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIHelperLogin {
  static textFieldCuston(String text, Icon icon, bool oculto, TextEditingController controller) {
    return Container(
      width: 350,
      height: 70,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        obscureText: oculto,
        autofocus: true,

        decoration: InputDecoration(


          hintText: text,
          suffixIcon: icon,
          filled: true,
          hintStyle: TextStyle(),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

Widget customButton(VoidCallback calback, String text) {
  return Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22), color: Colors.deepPurple),
    child: ElevatedButton(
      onPressed: calback,
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          backgroundColor: Colors.deepPurpleAccent),
      child: Text(
        text,

        style: TextStyle(color: Colors.white),



      ),
    ),
  );
}
