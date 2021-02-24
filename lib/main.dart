import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import './quiz.dart';
import './result.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

// void main() => runApp(MyApp());  uses only have one function with one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Guru', 'score': 1},
        {'text': 'Guru', 'score': 1},
        {'text': 'Guru', 'score': 1},
        {'text': 'Guru', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuize() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _ansQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have");
    } else {
      print("No more question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first title'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              ansQuestion: _ansQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalscore, _resetQuize),
    ));
  }
}
