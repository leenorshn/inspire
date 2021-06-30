import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoadingBouncingGrid.square(
          borderColor: Theme.of(context).accentColor,
          borderSize: 3.0,
          size: 64.0,
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(milliseconds: 1500)),
    );
  }
}
