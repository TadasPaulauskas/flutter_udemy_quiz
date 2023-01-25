import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Pirmas klausimas',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 1},
      ]
    },
    {
      'questionText': 'Antras klausimas',
      'answers': [
        {'text': 'Lietuvių', 'score': 3},
        {'text': 'Anglų', 'score': 5},
        {'text': 'Ispanų', 'score': 9},
      ]
    },
    {
      'questionText': 'Trečias\'is klausimas',
      'answers': [
        {'text': 'Idioms', 'score': 1},
        {'text': 'Vocabulary', 'score': 1},
        {'text': 'Other stuff', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('Mes dar turime daugiau klausimu');
    } else {
      print('No more questions');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tadas'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
