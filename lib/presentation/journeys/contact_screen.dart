import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/presentation/widgets/input_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informez nous!"),
        centerTitle: true,
        elevation: 0,
        leading: Icon(CupertinoIcons.chat_bubble_text),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        //color: Theme.of(context).accentColor,
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Envoyez nous votre information pour la verification",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple[800],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InputField(
              textHint: "Title de l'information ",
              iconData: CupertinoIcons.chat_bubble_text,
              controller: phoneController,
              radius: 8,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Votre message ici",
                labelStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                //suffixIcon: Icon(CupertinoIcons.chat_bubble_text),
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
                    primary: Colors.purple[900],
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
