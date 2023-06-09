import 'package:flutter/material.dart';
import 'package:flutterlicensenow/QuestionPresentationView.dart';
import 'package:flutterlicensenow/QuestionsNumberView.dart';
import 'package:signed_spacing_flex/signed_spacing_flex.dart';
import 'package:swipe_to/swipe_to.dart';

import 'Questions.dart';

class ExamPreparationScreen extends StatefulWidget {
  const ExamPreparationScreen({super.key, required this.data});

  final List<Questions> data;

  @override
  State<ExamPreparationScreen> createState() => _ExamPreparationScreenState();
}

class _ExamPreparationScreenState extends State<ExamPreparationScreen> {
  List<Questions> _questions = [];
  int count = 1;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  double _containerPosition = 0.0;
  double _containerOpacity = 1.0;

  void _animateLeft() {
    setState(() {
      _containerPosition = -400.0;
      _containerOpacity = 0.0;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _containerPosition = 0.0;
        _containerOpacity = 1.0;
      });
    });
    if (count > 1) {
      count -= 1;
    }
  }

  void _animateRight() {
    setState(() {
      _containerPosition = 400.0;
      _containerOpacity = 0.0;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _containerPosition = 0.0;
        _containerOpacity = 1.0;
      });
    });
    if (count < 200) {
      count += 1;
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
              '$count/200',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: SignedSpacingColumn(
        children: [
          Transform.translate(
              offset: const Offset(0.0, 70),
              child: QuestionsNumberView(count: count)),
          Expanded(
            child: SwipeTo(
             onLeftSwipe: (){
               _animateRight();
             },
              onRightSwipe: (){
               _animateLeft();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                transform:
                    Matrix4.translationValues(_containerPosition, 0.0, 0.0),
                child: Opacity(
                  opacity: _containerOpacity,
                  child: QuestionPresentationView(
                    data: _questions[count - 1],
                    layout: "preparation",
                    callback: _animateRight,
                    correctCallback: _animateRight,
                    wrongCallback: _animateRight,
                    isTappedCallback: _animateLeft,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 50, left: 20, right: 20),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: _animateLeft, child: const Text("Prev")),
                const Spacer(),
                ElevatedButton(
                    onPressed: _animateRight, child: const Text("Next")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void refreshData() async {
    setState(() {
      _questions = widget.data;
    });
  }
}
