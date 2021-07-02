import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:psony/data/repository/auth_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var auth = AuthRepository();

  String phoneController = "";

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
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: IntlPhoneField(
                countries: ["CD"],
                decoration: InputDecoration(
                  hintText: 'Ex: 988827000',
                  border: InputBorder.none,
                ),
                initialCountryCode: 'CD',
                showDropdownIcon: false,
                onChanged: (phone) {
                  print(phone.completeNumber);
                  setState(() {
                    phoneController = phone.completeNumber;
                  });
                },
              ),
            ),
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
                  onPressed: () async {
                    await auth.addUser(phone: phoneController);
                    Navigator.pop(context);
                  },
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
