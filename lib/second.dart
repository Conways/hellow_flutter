import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondPage extends StatelessWidget {

  String title;


  SecondPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(title),
        ),
      ),
    );
  }
}
