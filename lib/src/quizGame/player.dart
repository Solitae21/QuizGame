class Player {
  static int score = 0;
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  String? _playerName;
  static List<String> results = [];

  Player([String playerName = "Guest"]) {
    this._playerName = playerName;
  }

  String get playerName => this._playerName!;

  set playerName(String playerName) => this._playerName = playerName;

  int calculateScore() {
    return score = score + 10;
  }

  void getQuestionResults(bool result) {
    if (result) {
      correctAnswers++;
      print("Your score is: $score");
      print("Correct Answer: $correctAnswers");
      print("Wrong Answers: $wrongAnswers");
      results.add('correct');
      print(results);
    } else {
      wrongAnswers++;
      print("Your score is: $score");
      print("Correct Answer: $correctAnswers");
      print("Wrong Answers: $wrongAnswers");
      results.add('wrong');
      print(results);
    }
  }

  int getCorrectAnswers() {
    return correctAnswers;
  }

  int getWrongAnswers() {
    return wrongAnswers;
  }

  int getScore() {
    return score;
  }

  void reset() {
    score = 0;
    correctAnswers = 0;
    wrongAnswers = 0;
  }
}
