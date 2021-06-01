import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './results.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0; // STATE
  var _score = 0;

  final questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
      ],
    }
  ];

  void _answerQuestion(int s) {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        _score = _score + s;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('${questions.length - 1} ${_questionIndex}');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    (questions[_questionIndex]['questionText'] as String),
                  ),
                  ...(questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score'] as int),
                        (answer['text'] as String));
                  }).toList()
                ],
              )
            : Result(_score),
      ),
    );
  }
}
