import 'package:flutter/material.dart';

class QuestionsNumberView extends StatefulWidget {
  const QuestionsNumberView({super.key, required this.count});

  final int count;

  @override
  State<QuestionsNumberView> createState() => _QuestionsNumberViewState();
}

class _QuestionsNumberViewState extends State<QuestionsNumberView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: SizedBox(
        width: 100,
        height: 100,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            getCount(),
            style: const TextStyle(
                fontSize: 80, fontWeight: FontWeight.w700, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }

  String getCount() {
    if (widget.count > 15) {
      return "Result";
    } else {
      return widget.count.toString();
    }
  }
}
