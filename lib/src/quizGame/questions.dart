import 'dart:math';

class Questions {
  dynamic choiceA;
  dynamic choiceB;
  dynamic choiceC;
  dynamic choiceD;
  dynamic currentQuestion;
  var generatedNumbers = Set<int>();
  dynamic generatedChoiceNumbers = Set<int>();
  static Set<String> allQuestions = {};

  Map<String, String> answerKey = {
    '42': 'How many dots appear on a pair of dice?',
    'Eyes': 'Which is the only body part that is fully grown from birth?',
    '3': 'How many hearts does an octopus have?',
    'Mercury': 'What planet is closest to the sun?',
    'Nokia': 'What phone company produced the 3310?',
    'Jaw': 'Where is the strongest human muscle located?',
    '365 days':
        'How many days does it take for the Earth to orbit the Sun?(non leap year)',
    'The Nile': 'What is the longest river in the world?',
    'Tim Berners-Lee': 'Who invented the World Wide Web?',
    'World Wide Web': 'What does “www” stand for in a website browser?',
    'Fear of dogs': 'What is "cynophobia"?',
    'Samsung':
        'What is the name of the biggest technology company in South Korea?',
    'Pacific Ocean': 'What is the name of the World\'s largest ocean?',
    'Brown': 'What is the rarest M&M color?',
    'Honey': 'Which is the only edible food that never goes bad?',
    'Cheetah': 'What\'s the fastest land animal?',
    'Red': 'What color is a ruby?',
    'Seven': 'How many colors are there in the rainbow?',
    'A pale of water': 'What were Jack and Jill going up the hill to fetch?',
    'Vatican City': 'What\'s the smallest country in the world?',
    'Canis lupus' : 'What’s the scientific name of a wolf?',
    'Giraffe' : 'Which mammal has no vocal cords?',
    '108' : 'How many cards are there in a deck of Uno?',
    'India' : 'Mahatma Gandi’s birthday is a national holiday in which country?',
    'Scoliosis' : 'What is the medical term for a sideways curvature of the spine which most commonly occurs in young adults during a growth spurt?',
    '3 breeds' : 'How many breeds of elephant are there?',
    '62.8 trillion' : 'How many digits are in Pi?',
    'Angola' : 'Luanda is the capital city of which country?' ,
    'City of London' : 'What is the smallest city in England?',
    'Femur' : 'Which is the longest and largest bone in the body?',
    'Good Cholesterol' : 'What is a high-density lipoprotein known as?',
    'Diabetes' : 'What disease is due to improper use or production of insulin?',
    '650' : 'How many muscles does the human body have?',
    'Kidney' : 'What organ does a nephrologist specialize in?',
    'Hippocrates' : 'Who is considered the Father of Medicine?',
    'Heart Attack' : 'What is the more common name for myocardial infarction?',
  };

  List<String> questions = [
    'How many dots appear on a pair of dice?',
    'Which is the only body part that is fully grown from birth?',
    'How many hearts does an octopus have?',
    'What planet is closest to the sun?',
    'What phone company produced the 3310?',
    'Where is the strongest human muscle located?',
    'How many days does it take for the Earth to orbit the Sun?(non leap year)',
    'What is the longest river in the world?',
    'Who invented the World Wide Web?',
    'What does “www” stand for in a website browser?',
    'What is "cynophobia"?',
    'What is the name of the biggest technology company in South Korea?',
    'What is the name of the World\'s largest ocean?',
    'What is the rarest M&M color?',
    'Which is the only edible food that never goes bad?',
    'What\'s the fastest land animal?',
    'What color is a ruby?',
    'How many colors are there in the rainbow?',
    'What were Jack and Jill going up the hill to fetch?',
    'What\'s the smallest country in the world?',
    'What’s the scientific name of a wolf?',
    'Which mammal has no vocal cords?',
    'How many cards are there in a deck of Uno?',
    'Mahatma Gandi’s birthday is a national holiday in which country?',
    'What is the medical term for a sideways curvature of the spine which most commonly occurs in young adults during a growth spurt?',
    'How many breeds of elephant are there?',
    'How many digits are in Pi?',
    'Luanda is the capital city of which country?',
    'What is the smallest city in England?',
    'Which is the longest and largest bone in the body?',
    'What is a high-density lipoprotein known as?',
    'What disease is due to improper use or production of insulin?',
    'How many muscles does the human body have?',
    'What organ does a nephrologist specialize in?',
    'Who is considered the Father of Medicine?',
    'What is the more common name for myocardial infarction?',
  ];

  List<List<String>> choices = [
    ['41', '40', '39', '42'],
    ['Eyes', 'Skull', 'Brain', 'Nose'],
    ['3', '2', '4', '5'],
    ['Mercury', 'Earth', 'Venus', 'Pluto'],
    ['Nokia', 'Blackberry', 'Sony Ericson', 'Cherry Mobile'],
    ['Jaw', 'Hands', 'Arms', 'Legs'],
    ['365 days', '366 days', '355 days', '364 days'],
    ['The Nile', 'Amazon River', 'Volga River', 'Mississippi River'],
    ['Tim Berners-Lee', 'Steve Jobs', 'Bill Gates', 'Lawrence Edward Page'],
    ['World Wide Web', 'World War Week', 'What When Where', 'World Wide Well'],
    ['Fear of dogs', 'Fear of Spiders', 'Fear of Darkness', 'Fear of Tigers'],
    ['Samsung', 'LG Electronics', 'Kia Motors', 'Hyundai'],
    ['Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean'],
    ['Brown', 'Black', 'Pink', 'White'],
    ['Honey', 'Peanut Butter', 'Chocolate', 'Hamburger'],
    ['Cheetah', 'Horse', 'Lion', 'Pronghorn'],
    ['Red', 'Scarlet', 'Orange', 'Dark Orange'],
    ['Seven', 'Eight', 'Six', 'Nine'],
    ['A pale of water', 'Pile of wood', 'A cat', 'A rooster'],
    ['Vatican City', 'Maldives', 'Taiwan', 'Monaco'],
    ['Canis lupus', 'Canis lupus familiaris', 'Felis catus', 'Equus caballus'],
    ['Giraffe','Lizard','Snake','Horse'],
    ['107','108','110','111'],
    ['India','Saudi Arabia','Egypt','Middle East'],
    ['Scoliosis','Arthritis','Lumbar Lordosis','Thoracic Kyphosis'],
    ['3 breeds','4 breeds','2 breeds','5 breeds'],
    ['62.8 trillion','68.2 trillion','872 billion','infinite'],
    ['Angola','Alaska','Romania','Lithuania'],
    ['City of London','City of Westminster','Hackney','Barnet'],
    ['Femur','Tibia','Fibula','Humerus'],
    ['Good Cholesterol','Triglycerides','LDL','VLDL'],
    ['Diabetes','Kidney Stones','Gout','Hypoglycemia'],
    ['650','750','600','550'],
    ['Kidney','Liver','Lungs','Stomach'],
    ['Hippocrates','Aristotle','Socrates','Sir Alexander Fleming'],
    ['Heart Attack','High Blood','Cardiac Arrest','Low blood'],
  ];

  void getChoices(int index) {
    String? choice;

    // Generate 4 random numbers and add them to the set.

    choiceA = choices[index][generatedChoiceNumbers.elementAt(0)];
    choiceB = choices[index][generatedChoiceNumbers.elementAt(1)];
    choiceC = choices[index][generatedChoiceNumbers.elementAt(2)];
    choiceD = choices[index][generatedChoiceNumbers.elementAt(3)];
    //choice = "A. $choiceA\nB. $choiceB\nC. $choiceC\nD. $choiceD";
    //return choice;
  }

  void clearRandChoiceSet(){
    generatedChoiceNumbers.clear();
  }

  void generateRandomSet() {
    while (true) {
      if (generatedNumbers.length != questions.length) {
        var randomNumber = Random().nextInt(questions.length);
        generatedNumbers.add(randomNumber);
      } else {
        break;
      }
    }


    print(generatedNumbers);


  }
  String generateQuestions(int index) {
    String? question;
    // var generatedNumbers = Set<int>();
    // while (true) {
    //   if (generatedNumbers.length != 20) {
    //     var randomNumber = Random().nextInt(20);
    //     generatedNumbers.add(randomNumber);
    //   } else {
    //     break;
    //   }
    // }
    //var randomNumber = Random().nextInt(questions.length);
    while (true) {
      if (generatedChoiceNumbers.length != 4) {
        var randomChoiceNumber = Random().nextInt(4);
        generatedChoiceNumbers.add(randomChoiceNumber);
      } else {
        break;
      }
    }
    print(generatedChoiceNumbers);
    currentQuestion = questions[generatedNumbers.elementAt(index)];
    question = "$currentQuestion";
    getChoices(generatedNumbers.elementAt(index));
    return question;
  }
}
