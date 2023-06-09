import 'dart:async';

import 'package:flutter/material.dart';

import 'Questions.dart';

class QuestionPresentationView extends StatefulWidget {
  const QuestionPresentationView(
      {super.key,
      required this.data,
      required this.layout,
      required this.callback,
      required this.correctCallback,
      required this.wrongCallback,
      required this.isTappedCallback});

  final Questions data;
  final String layout;
  final VoidCallback callback;
  final VoidCallback correctCallback;
  final VoidCallback wrongCallback;
  final VoidCallback isTappedCallback;

  @override
  State<QuestionPresentationView> createState() =>
      _QuestionPresentationViewState();
}

class _QuestionPresentationViewState extends State<QuestionPresentationView> {
  Color option1Color = Colors.grey.shade400;
  Color option2Color = Colors.grey.shade400;
  Color option3Color = Colors.grey.shade400;
  int tap = 4;
  String question = "";
  bool isTapEnabled = true;

  @override
  void initState() {
    clearColor();
    question = widget.data.question;

    super.initState();
  }

  void setColor() {
    clearColor();
    if (widget.data.ans == 1) {
      option1Color = Colors.green.shade400;
    }
    if (widget.data.ans == 2) {
      option2Color = Colors.green.shade400;
    }
    if (widget.data.ans == 3) {
      option3Color = Colors.green.shade400;
    }
  }

  void correctColor(int ans) {
    switch (ans) {
      case 1:
        option1Color = Colors.green.shade400;
        break;
      case 2:
        option2Color = Colors.green.shade400;
        break;
      case 3:
        option3Color = Colors.green.shade400;
        break;
    }
  }

  void wrongColor(int tap) {
    switch (tap) {
      case 1:
        option1Color = Colors.red.shade400;
        break;
      case 2:
        option2Color = Colors.red.shade400;
        break;
      case 3:
        option3Color = Colors.red.shade400;
        break;
      case 4:
        clearColor();
        break;
    }
  }

  void trueColor(int tap) async {
    int ans = widget.data.ans;
    isTapEnabled = false;
    if (tap == ans) {
      question = widget.data.question;
      correctColor(ans);
      widget.correctCallback();
    } else {
      question = widget.data.question;
      wrongColor(tap);
      correctColor(ans);
      widget.wrongCallback();
    }
    await Future.delayed(const Duration(milliseconds: 2000));
    clearColor();
    widget.callback();
  }

  void clearColor() {
    option1Color = Colors.grey.shade400;
    option2Color = Colors.grey.shade400;
    option3Color = Colors.grey.shade400;

    isTapEnabled = true;
  }

  @override
  void setState(VoidCallback fn) {
    clearColor();
    trueColor(tap);
    widget.isTappedCallback();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.layout == "preparation") {
      setColor();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 4.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  widget.data.question,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                if (widget.data.isImage != null &&
                    widget.data.isImage != 0) ...[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child:
                        Image.asset("assets/images/img${widget.data.img}.jpg"),
                  )
                ],
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: isTapEnabled
                      ? () {
                          if (widget.layout != "preparation") {
                            tap = 1;
                            widget.isTappedCallback();
                            trueColor(tap);
                          }
                        }
                      : null,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: option1Color,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("a). ${widget.data.option1}"),
                    ),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: option2Color,
                    elevation: 4,
                    child: InkWell(
                      onTap: isTapEnabled
                          ? () {
                              if (widget.layout != "preparation") {
                                widget.isTappedCallback();
                                tap = 2;
                                trueColor(2);
                              }
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("b). ${widget.data.option2}"),
                      ),
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: option3Color,
                    elevation: 4,
                    child: InkWell(
                      onTap: isTapEnabled
                          ? () {
                              if (widget.layout != "preparation") {
                                widget.isTappedCallback();
                                tap = 3;
                                trueColor(3);
                              }
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("c). ${widget.data.option3}"),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
