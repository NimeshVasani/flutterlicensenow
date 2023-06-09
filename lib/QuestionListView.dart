import 'package:flutter/material.dart';
import 'package:flutterlicensenow/Questions.dart';

class QuestionListView extends StatefulWidget {
  final List<Questions> data;

  const QuestionListView({super.key, required this.data});

  @override
  State<QuestionListView> createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${index + 1}.",
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.data[index].question,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'a). ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: getAnswer(widget.data[index].ans, index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.data[index].isImage != null &&
                      widget.data[index].isImage != 0) ...[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                          "assets/images/img${widget.data[index].img}.jpg"),
                    )
                  ]
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.data.length,
    );
  }

  String getAnswer(int ans, int index) {
    String answer;
    switch (ans) {
      case 1:
        answer = widget.data[index].option1;
        break;
      case 2:
        answer = widget.data[index].option2;
        break;
      case 3:
        answer = widget.data[index].option3;
        break;
      default:
        answer = "";
    }
    return answer;
  }
}
