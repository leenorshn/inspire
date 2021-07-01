import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.textHint,
      this.radius,
      required this.iconData,
      this.keyboard})
      : super(key: key);
  final String textHint;
  final IconData iconData;
  final double? radius;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: textHint,
          labelStyle: TextStyle(
            color: Colors.grey[700],
          ),
          suffixIcon: Icon(iconData),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
