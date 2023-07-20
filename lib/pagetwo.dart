import 'package:flutter/material.dart';
import 'package:my_app/quizPage.dart';

import 'homepage.dart';

class PlayerProfile extends StatefulWidget {
  const PlayerProfile({super.key});

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {

  Widget buildCreateUsername(){
    return Container(
      width: 300,
      height: 60,
      child: TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          border: UnderlineInputBorder(),
          labelText: 'Enter your username',
        ),
      ),
    );
  }

  Widget buildCreatebtn(){
    return Container(
      child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => StartQuiz()
              ),
            );
          },
          child: Text('CREATE USERNAME')
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: const BackButton(
        color: Colors.black, // <-- SEE HERE
      ),
      backgroundColor: Colors.white,
      title: Text('Create Player Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          )),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child:
            Text('Create Your Profile',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 8,),)
        ),
      buildCreateUsername(),
      SizedBox(height: 15),
      buildCreatebtn()],
    ),
    );
  }
}

class CreatePlayerProfile extends StatefulWidget {
  const CreatePlayerProfile({super.key, this.userName});

  final userName;

  @override
  State<CreatePlayerProfile> createState() => _CreatePlayerProfileState();
}

class _CreatePlayerProfileState extends State<CreatePlayerProfile> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[Text('testing')]
    );
  }
}


