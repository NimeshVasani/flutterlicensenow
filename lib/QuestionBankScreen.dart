

import 'package:flutter/material.dart';
import 'package:flutterlicensenow/QuestionListView.dart';
import 'package:flutterlicensenow/Questions.dart';
import 'package:flutterlicensenow/db_helper.dart';

class QuestionBankScreen extends StatefulWidget {
  const QuestionBankScreen({super.key,required this.language});
  final String language;

  @override
  State<QuestionBankScreen> createState() => _QuestionBankScreenState();
}

class _QuestionBankScreenState extends State<QuestionBankScreen> {
  final dbHelper = DBHelper();
  List<Questions> _questions = [];
  @override
  void initState() {

    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Question Bank"),
          centerTitle: true,
        ),
        body: QuestionListView(data: _questions,)
    );
  }
  void refreshData() async{
    final data = await dbHelper.getQuestions(widget.language);
    setState(() {
      _questions = data;
    });
  }
}
