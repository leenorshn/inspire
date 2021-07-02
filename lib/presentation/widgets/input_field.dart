import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.textHint,
      this.radius,
      required this.iconData,
      required this.controller,
      this.keyboard})
      : super(key: key);
  final String textHint;
  final IconData iconData;
  final double? radius;
  final TextInputType? keyboard;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        decoration: InputDecoration(
          hintText: textHint,
          labelStyle: TextStyle(
            color: Colors.grey[700],
          ),
          suffixIcon: Icon(iconData),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
            borderSide: BorderSide(color: Colors.white70),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
            borderSide: BorderSide(color: Colors.white70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
