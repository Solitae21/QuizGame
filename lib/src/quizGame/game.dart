import 'dart:io';
import 'player.dart';
import 'questions.dart';
import 'dart:math';

class Game {
  Player newPlayer = Player();
  Questions quiz = Questions();

  var generatedNumbers = Set<int>();

  void generateNum() {
    while (true) {
      if (generatedNumbers.length != 20) {
        var randomNumber = Random().nextInt(20);
        generatedNumbers.add(randomNumber);
      } else {
        break;
      }
    }
  }

  // Generate 4 random numbers and add them to the set.

  void enterPlayerName() {
    print("---------- Welcome ${newPlayer.playerName} ----------");
    while (true) {
      stdout.write("Please Enter your Player Name: ");
      String? playerInput = stdin.readLineSync()!;
      if (playerInput.isEmpty) {
        print("Please enter valid input!");
      } else if (playerInput.isNotEmpty) {
        newPlayer.playerName = playerInput;
        print("Username saved successfully.");
        mainMenu();
        break;
      }
    }
  }

  void checkAnswer(String playerAnswer) {
    if (quiz.answerKey.containsKey(playerAnswer)) {
      print("\nYour Answer is Correct!");
      print("+10 POINTS\n");
      newPlayer.calculateScore();
      newPlayer.getQuestionResults(true);
    } else {
      // String? correctAnswer;
      // quiz.answerKey.forEach((key, value) {
      //   if (value.contains(quiz.currentQuestion)) {
      //     correctAnswer = key;
      //   }
      // });
      // print("\nSorry! Your answer is wrong");
      // print("The correct answer is: $correctAnswer\n");
      newPlayer.getQuestionResults(false);
    }
  }

  void startQuiz() {
    startGame:
    while (true) {
      for (int i = 0; i < 10; i++) {
        print(
            "\n${i + 1} ${quiz.generateQuestions(generatedNumbers.elementAt(i))}");
        getAnswer:
        while (true) {
          stdout.write("Your Answer: ");
          String? playerAnswer = stdin.readLineSync()!;
          switch (playerAnswer) {
            case 'A' || 'a':
              checkAnswer(quiz.choiceA);
              break getAnswer;
            case 'B' || 'b':
              checkAnswer(quiz.choiceB);
              break getAnswer;
            case 'C' || 'c':
              checkAnswer(quiz.choiceC);
              break getAnswer;
            case 'D' || 'd':
              checkAnswer(quiz.choiceD);
              break getAnswer;
            default:
              print("Invalid Input. Please Try Again.");
          }
        }
      }

      print("\nYour total score is: ${newPlayer.getScore()}");
      print(
          "You have a total of \nCorrect Answers: ${newPlayer.getCorrectAnswers()}\nWrong Answers: ${newPlayer.getWrongAnswers()}");
      print("[1] Try Again? [0] Exit");
      while (true) {
        stdout.write("Your Input: ");
        String? choice = stdin.readLineSync()!;
        switch (choice) {
          case '1':
            stdout.write('\x1B[2J');
            print("Creating new game.\n");
            newPlayer.reset();
            startQuiz();
            break startGame;
          case '0':
            exit(0);
          default:
            print("Invalid Input! Please enter correct input.");
        }
      }
    }
  }

  void mainMenu() {
    stdout.write('\x1B[2J');
    print(
        "---------- Welcome to my General Quiz ${newPlayer.playerName} ----------");
    print("[1] Start Quiz");
    print("[0] Exit");
    getInput:
    while (true) {
      stdout.write("Your input: ");
      String? playerInput = stdin.readLineSync()!;
      switch (playerInput) {
        case '1':
          startQuiz();
          break getInput;
        case '0':
          exit(0);
        default:
          print("Invalid Input. Please type correct Input.");
      }
    }
  }

  void launchGame() {
    enterPlayerName();
  }
}
