import 'package:flutter/material.dart';

class IntoxPage extends StatelessWidget {
  const IntoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Protocol de correction",
          style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
