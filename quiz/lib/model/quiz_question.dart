class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffeledAnswers() {
    var copy = List.of(answers);
    copy.shuffle();
    return copy;
  }
}
