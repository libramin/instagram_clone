import 'package:flutter/material.dart';

InputDecoration inputDeco(String hint) {
  return InputDecoration(
    hintText: hint,
    enabledBorder: activeInputBorder(Colors.grey.withOpacity(0.5)),
    focusedBorder: activeInputBorder(Colors.black),
    errorBorder: activeInputBorder(Colors.red),
    focusedErrorBorder: activeInputBorder(Colors.black),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  );
}

OutlineInputBorder activeInputBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}