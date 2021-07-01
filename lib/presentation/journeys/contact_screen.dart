import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psony/presentation/widgets/input_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
              "Envoyez nous votre information pour la verification",
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
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Votre message ici",
                labelStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                suffixIcon: Icon(CupertinoIcons.chat_bubble_text),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white70),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white70),
                ),
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
                  onPressed: () {},
                  child: Text("Envoyer"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
