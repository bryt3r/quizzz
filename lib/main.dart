// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what is your name ?',
      'answers': [
        {'text': 'Me', 'score': 5},
        {'text': 'Myself', 'score': 10},
        {'text': 'I', 'score': 15}
      ]
    },
    {
      'questionText': 'what is your age ?',
      'answers': [
        {'text': 'young', 'score': 15},
        {'text': 'old', 'score': 10},
        {'text': 'ancestor', 'score': 5}
      ]
    },
    {
      'questionText': 'what is your favourite color ?',
      'answers': [
        {'text': 'white', 'score': 5},
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 15}
      ]
    },
    {
      'questionText': 'what phone do you use ?',
      'answers': [
        {'text': 'iphone', 'score': 5},
        {'text': 'android', 'score': 10},
        {'text': 'symbian', 'score': 15}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alpha App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
