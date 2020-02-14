import 'package:flutter/material.dart';

class PalTitleView extends StatelessWidget {
  final String title;

  PalTitleView({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.lightBlue,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
