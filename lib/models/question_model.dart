class QuestionModel {
  QuestionModel(this.questionText, this.answers);

  final String questionText;
  final List<String> answers ;
//getter
  List<String> get shuffledAnswers {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}