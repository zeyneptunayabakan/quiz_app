import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  const ResultScreen({
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      appBar: AppBar(
        centerTitle: true,
        title: Text('SONUÇLAR',style:TextStyle(color:Colors.orangeAccent)),
        backgroundColor: Color.fromARGB(255, 5, 50, 80),
      ),
      body: AlertDialog(
        backgroundColor: Colors.brown,
        scrollable: true,
        title: Text('Sonuçlar',style:TextStyle(color:Colors.orangeAccent)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            questions.length,
            (index) {
              final isCorrect = userAnswers[index] ==
                  questions[index].answers
                      .firstWhere((answer) => answer.isCorrect)
                      .answer;
              return ListTile(
                title: Text(
                  'Soru ${index + 1}: ${isCorrect ? "Doğru" : "Yanlış"}',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Kapat',style:TextStyle(color:Colors.orangeAccent)),
          ),
        ],
      ),
    );
  }
}