import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterlicensenow/ExamResultScreen.dart';
import 'package:signed_spacing_flex/signed_spacing_flex.dart';

import 'QuestionPresentationView.dart';
import 'Questions.dart';
import 'QuestionsNumberView.dart';

class FinalExamScreen extends StatefulWidget {
  const FinalExamScreen({super.key, required this.data});

  final List<Questions> data;

  @override
  State<FinalExamScreen> createState() => _FinalExamScreenState();
}

class _FinalExamScreenState extends State<FinalExamScreen> {
  int correct = 0;
  int wrong = 0;
  int time = 30;
  List<Questions> _questions = [];
  int count = 1;
  bool isTapped = false;
  List<int> randomNumbers = [];

  @override
  void initState() {
    super.initState();
    refreshData();
    startTimer();
    randomNumbers = generateRandomNumbers(15, 0, 199);
  }

  List<int> generateRandomNumbers(int count, int min, int max) {
    List<int> numbers = [];
    Random random = Random();

    while (numbers.length < count) {
      int randomNumber = random.nextInt(max - min + 1) + min;
      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }

    return numbers;
  }

  double _containerPosition = 0.0;
  double _containerOpacity = 1.0;

  void _animateRight() {
    setState(() {
      _containerPosition = 400.0;
      _containerOpacity = 0.0;
      isTapped = false;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _containerPosition = 0.0;
        _containerOpacity = 1.0;
      });
    });
    if (count <= 15) {
      count += 1;
    }
    else{

    }
  }

  int _timerDuration = 30;
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
      if (_elapsedSeconds >= _timerDuration) {
        if (count >= 15) {

          _animateRight();
          _timer?.cancel();
        } else {
          _timer?.cancel();
          _timerDuration = 30;
          _elapsedSeconds = 0;
          if (!isTapped) {
            setState(() {
              wrong += 1;
            });
          }
          _animateRight();
          startTimer();
        }
      }
    });
  }

  void setCorrect() {
    correct += 1;
  }

  void setWrong() {
    wrong += 1;
  }

  void setIsTapped() {
    isTapped = !isTapped;
  }

  void resetTimer() {
    if (count < 15) {
      _timer?.cancel();
      _timerDuration = 30;
      _elapsedSeconds = 0;
      _animateRight();
      startTimer();
    }
    else{
      _timer?.cancel();
      _animateRight();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Preparation"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 20),
            child: Text(
              '$count/15',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: SignedSpacingColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Correct : $correct",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "Wrong : $wrong",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  "time : ${30 - _elapsedSeconds}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )
              ],
            ),
          ),
          Transform.translate(
              offset: const Offset(0.0, 70),
              child: QuestionsNumberView(count: count)),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform:
                  Matrix4.translationValues(_containerPosition, 0.0, 0.0),
              child: Opacity(
                opacity: _containerOpacity,
                child: getWidget()
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
Widget getWidget(){
    if(count<=15){
     return QuestionPresentationView(
        data: _questions[randomNumbers[count - 1]],
        layout: "exam",
        callback: resetTimer,
        correctCallback: setCorrect,
        wrongCallback: setWrong,
        isTappedCallback: setIsTapped,
      );
    }
    else{
      return ExamResultScreen(correct: correct, wrong: wrong);
    }
}
  void refreshData() async {
    setState(() {
      _questions = widget.data;
    });
  }
}
