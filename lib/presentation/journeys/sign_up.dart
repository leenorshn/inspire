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
        elevation: 0,
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).accentColor,
        child: ListView(
          children: [
            SizedBox(
              height: 52,
            ),
            Text(
              "Veuillez remplir ce formulaire pour appartenir à la grande famille \n Inspire",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InputField(
              textHint: "Nom complet",
              iconData: CupertinoIcons.person,
              radius: 8,
            ),
            InputField(
              textHint: " phone ex: +243 99999 . . . ",
              iconData: Icons.phone_android,
              radius: 8,
            ),
            ComboBox(items: ["Masculin", "Femmine"], label: "Genre"),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                    padding: EdgeInsets.symmetric(
                      horizontal: 56,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Rejoindre"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
