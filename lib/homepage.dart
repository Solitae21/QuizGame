import 'package:flutter/material.dart';
import 'package:my_app/quizPage.dart';
import 'package:my_app/src/quizGame/player.dart';
import 'package:my_app/src/quizGame/questions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Player.score = 0;
    Player.correctAnswers = 0;
    Player.wrongAnswers = 0;
    Questions.allQuestions.clear();
    Player.results.clear();
    print(Questions.allQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('QUIZ APP',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              letterSpacing: 3,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            // Replace with your own image path
            fit: BoxFit.cover,
            opacity: 85,
          ),
        ),
        child: HomepageBody(),
      ),
    ));
  }
}

class HomepageBody extends StatefulWidget {
  const HomepageBody({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome to my',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  height: 4,
                  color: Colors.white,
                ),
              ),
              Text(
                'QUIZ GAME',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -2,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Press ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                )),
            Text(
              ' START',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(' button',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                )),
          ],
        ),
        SizedBox(height: 15),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              fixedSize: Size(300, 10),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StartQuiz(),
                ),
              );
            },
            child: Text('START', style: TextStyle(
              fontWeight: FontWeight.w900,
            ),)),
      ],
    );
  }
}
