class Questions {
  final String question;

  final String option1;

  final String option2;

  final String option3;

  final int ans;

   int? isImage = 0;
  final  int? img;

  Questions(
      {required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.ans,
       this.isImage,
       this.img});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'ans': ans,
      'isImage': isImage,
      'img': img
    };
    return map;
  }
}
