import 'package:flutter/material.dart';

class ExamResultScreen extends StatefulWidget{
  const ExamResultScreen({super.key,required this.correct,required this.wrong});

  final int correct;
  final int wrong;

  @override
  State<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {


  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Card(
       shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(20))),
       elevation: 4.0,
       child: Container(
         width: double.infinity,
         padding: const EdgeInsets.all(16.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             greetings(),
             showCorrectMarks(),
             showWrongMarks()
           ],
         ),
       ),
     ),
   );
  }

  Widget greetings(){
    if(widget.correct>10){
      return const Text("Congratulations...\nYou Successfully Cleared the Exam",style: TextStyle(color: Colors.green,fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
    }
    else{
      return const Text("Opps..You couldn't make it\nGive a re-try",style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
    }
  }
  Widget showCorrectMarks(){
    return Text("Correct : ${widget.correct}",style: const TextStyle(color: Colors.green,fontSize: 18),);
  }
  Widget showWrongMarks(){
    return Text("Wrong : ${widget.wrong}",style: const TextStyle(color: Colors.red,fontSize: 18),);
  }
}