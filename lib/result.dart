import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String reasultText;

    if (resultScore <= 8) {
      reasultText = 'You are awesome';
    } else if (resultScore <= 15) {
      reasultText = 'You are in a middle';
    } else {
      reasultText = 'You are in a low results';
    }
    return reasultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 15.0,
            ),
            child: Text('Reset Quiz'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
