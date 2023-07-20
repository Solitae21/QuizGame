import 'package:flutter/material.dart';
import 'package:my_app/src/quizGame/questions.dart';
import 'package:my_app/src/quizGame/game.dart';
import 'package:my_app/viewScore.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.lightbulb_outline_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text('QUIZ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              letterSpacing: 3,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/quizbg.jpg'),
            fit: BoxFit.cover,
            isAntiAlias: true,
            opacity: 70,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenerateQuestions(),
            SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}

class GenerateQuestions extends StatefulWidget {
  const GenerateQuestions({super.key});

  @override
  State<GenerateQuestions> createState() => _GenerateQuestionsState();
}

class _GenerateQuestionsState extends State<GenerateQuestions> {
  static int index = 0;
  String? choices;
  dynamic questionNum;
  bool? hasAnswer;
  Questions question = Questions();
  Game game = Game();


  @override
  void initState() {
    super.initState();
    hasAnswer = false;
    question.generateRandomSet();
    questionNum = 1;
  }

  void setSelectedChoice(String val) {
    setState(() {
      choices = val;
      hasAnswer = true;
    });
  }

  Widget submitAnswerBtn(bool hasAnswered) {
    var btn;
    (hasAnswered)
        ? btn = ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              fixedSize: Size(300, 10),
            ),
            onPressed: () {
              if (questionNum < 10) {
                if (choices != '') {
                  game.checkAnswer(choices!);
                  setState(() {
                    questionNum++;
                    choices = '';
                    hasAnswer = false;
                  });
                question.clearRandChoiceSet();
                } else if (choices == '') {}
              } else {
                game.checkAnswer(choices!);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewScore(),
                  ),
                );
              }
            },
            child: Text(
              'SUBMIT ANSWER',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : btn = ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              fixedSize: Size(300, 10),
            ),
            onPressed: null,
            child: Text(
              'SUBMIT ANSWER',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));

    return btn;
  }

  Widget generateQuestions({required int index}) {
    final currQuestion = question.generateQuestions(index);
    Questions.allQuestions.add(currQuestion);
    print(Questions.allQuestions);
    var hei = MediaQuery.of(context).size;
    print('sieeeee${hei}');
    return Center(
      child: Column(
        children: [
          Container(
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color(0xFFfba304),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Question $questionNum out of 10',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  currQuestion,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      RadioListTile(
                        title: Text("A. ${question.choiceA}"),
                        value: question.choiceA,
                        groupValue: choices,
                        onChanged: (value) {
                          print('clicked A');
                          setSelectedChoice(value);
                        },
                      ),
                      RadioListTile(
                        title: Text("B. ${question.choiceB}"),
                        value: question.choiceB,
                        groupValue: choices,
                        onChanged: (value) {
                          print('clicked B');
                          setSelectedChoice(value);
                        },
                      ),
                      RadioListTile(
                        title: Text("C. ${question.choiceC}"),
                        value: question.choiceC,
                        groupValue: choices,
                        onChanged: (value) {
                          print('clicked C');
                          setSelectedChoice(value);
                        },
                      ),
                      RadioListTile(
                        title: Text("D. ${question.choiceD}"),
                        value: question.choiceD,
                        groupValue: choices,
                        onChanged: (value) {
                          print('clicked D');
                          setSelectedChoice(value.toString());
                        },
                      )
                    ],
                  ),
                ],
              )),
          const SizedBox(height: 10),
          submitAnswerBtn(hasAnswer!), //hhh
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [generateQuestions(index: questionNum - 1)],
    );
  }
}
