import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/src/quizGame/game.dart';
import 'package:my_app/src/quizGame/player.dart';
import 'package:my_app/src/quizGame/questions.dart';

class ViewScore extends StatefulWidget {
  const ViewScore({super.key});

  @override
  State<ViewScore> createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {
  Player player = Player();
  Questions question = Questions();
  Game game = Game();


  Widget viewScore() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
        child: Column(
          children: [
            (Player.correctAnswers>5)?
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.greenAccent,
              size: 60,
            )
                : Icon(
              Icons.cancel_rounded,
              color: Colors.redAccent,
              size: 60,
            ),

            SizedBox(height: 10),
            Text(
              'Correct Answers: ${player.getCorrectAnswers()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Wrong Answers: ${player.getWrongAnswers()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Your Score: ${player.getScore()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget correctAnswerTile(int index){
    String questions = Questions.allQuestions.elementAt(index);
    String? correctAnswer;
    question.answerKey.forEach((key, value) {
      if (value.contains(questions)) {
        correctAnswer = key;
      }
    });
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        leading: (Player.results[index]=='correct') ? Icon(Icons.check_circle_outline_rounded, color: Colors.greenAccent, size: 50,) : Icon(Icons.cancel_rounded, color: Colors.redAccent, size: 50,),
        title: Text(questions),
        subtitle: Text('Correct Answer: ${correctAnswer}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.list_alt_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text('RESULTS',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              letterSpacing: 3,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/scoresbg.jpg'),
              fit: BoxFit.cover,
              isAntiAlias: true,
              opacity: 70,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                viewScore(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      fixedSize: Size(300, 10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ),
                      );
                    },
                    child: Text(
                      'EXIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 270,),
                Text('Scroll down to view Correct Answers', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 20,),
                Column(
                  children: [
                    correctAnswerTile(0),
                    correctAnswerTile(1),
                    correctAnswerTile(2),
                    correctAnswerTile(3),
                    correctAnswerTile(4),
                    correctAnswerTile(5),
                    correctAnswerTile(6),
                    correctAnswerTile(7),
                    correctAnswerTile(8),
                    correctAnswerTile(9),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
