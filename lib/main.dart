import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          'This is where the question text will go.',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        TextButton(
          onPressed: () {},
          child: Container(margin: 
            color: Colors.green,
            child: Text(
              'true',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'false',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
        )
      ])),
    );
  }
}
