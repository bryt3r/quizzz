// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "All Done ";

    if (resultScore <= 20) {
      resultText = "You Try";
    } else if (resultScore <= 40) {
      resultText = "You Try Small";
    } else if (resultScore <= 50) {
      resultText = "You Try Well !";
    } else {
      resultText = "You Try Wella !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
