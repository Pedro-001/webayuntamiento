// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textcontroller;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeHolder,
      required this.textcontroller,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5),
          ]),
      child: TextField(
        controller: textcontroller,
        autocorrect: false,
        keyboardType: keyboardType,
        //obscureText: false,
        decoration: InputDecoration(
            prefix: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeHolder),
      ),
      //ElevatedButton(onPressed: () {}, child: const Text('data')
    );
  }
}