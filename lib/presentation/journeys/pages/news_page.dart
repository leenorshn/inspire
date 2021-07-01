import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Liste des actualites",
          style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
