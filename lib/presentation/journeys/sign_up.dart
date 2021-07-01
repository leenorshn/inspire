import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psony/presentation/widgets/combo_box.dart';
import 'package:psony/presentation/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspire Community"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: ListView(
          children: [
            Text(
                "Veuillez remplir ce formulaire pour appartenir à la grande famille"),
            InputField(
              textHint: "Nom complet",
              iconData: CupertinoIcons.person,
              radius: 8,
            ),
            InputField(
              textHint: "Phone number",
              iconData: CupertinoIcons.person,
              radius: 8,
            ),
            ComboBox(items: ["Masculin", "Femmine"], label: "Genre"),
          ],
        ),
      ),
    );
  }
}
