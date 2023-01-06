import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(
      () {
        if (quizBrain.isFinished() == false) {
          if (userPickedAnswer == correctAnswer) {
            scoreKeeper.add(
              Icon(Icons.check, color: Colors.green),
            );
          } else {
            scoreKeeper.add(
              Icon(Icons.close, color: Colors.red),
            );
          }
          ;
          quizBrain.nextQuestion();
        } else {
          Alert(
                  context: context,
                  title: "You have finished",
                  desc: "This is the end of the quiz.")
              .show();
          quizBrain.reset();
          scoreKeeper = [];
        }
      },
    );
  }
  // List<String> questions = [
  //   'Approximately one quarter of human bones are in the feet',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];

  // Question q1 = Question(q: 'You can lead a cow down stairs but not upstairs.', a: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                // The user picked true
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                // The user picked false
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
