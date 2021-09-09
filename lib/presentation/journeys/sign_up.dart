import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspire/data/repository/auth_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var auth = AuthRepository();

  TextEditingController phoneController = TextEditingController();

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
                color: Colors.purple[800],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              //padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      child: Text("+243"),
                    ),
                    hintText: "9 7 8 2 2 3 . . ."),
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
                    primary: Colors.purple[900],
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 56,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () async {
                    await auth.addUser(phone: "+243" + phoneController.text);
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
