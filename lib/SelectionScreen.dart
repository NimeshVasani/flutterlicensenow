import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterlicensenow/ExamPreparationScreen.dart';
import 'package:flutterlicensenow/FinalExamScreen.dart';
import 'package:flutterlicensenow/QuestionBankScreen.dart';
import 'package:flutterlicensenow/Questions.dart';
import 'package:flutterlicensenow/ServicesScreen.dart';
import 'package:flutterlicensenow/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key, required this.language});

  final String language;

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late List<Questions> _data;

  var dbHelper = DBHelper();

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffb6c1),
      appBar: AppBar(
        title: Text("Prepare in  ${widget.language}"),
        backgroundColor: const Color(0Xffff0000),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionBankScreen(
                                    language: widget.language,
                                  )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText(
                          "Question Bank",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/question_bank.png')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                height: 140,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExamPreparationScreen(
                                    data: _data,
                                  )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText(
                          "Exam Preparation",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/mock_test_icon.png')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalExamScreen(
                                    data: _data!,
                                  )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText(
                          "Exam",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/exam_test_icon.png')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                height: 140,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AutoSizeText(
                          "Service",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/service.png')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void refreshData() async {
    final data = await dbHelper.getQuestions(widget.language);
    setState(() {
      _data = data;
    });
  }
}
