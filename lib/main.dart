import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'quizbrain.dart';

var quizBrain = QuizBrain();
int nextQuestionNumber = quizBrain.questionPicker();

void main() {
  print('----- void main is called');
  runApp(const MyApp());
  print('nextQuestionNumber = $nextQuestionNumber');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Is the following statement true?',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        body: const MyBodyApp(),
      ),
    );
  }
}


class MyBodyApp extends StatefulWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  _MyBodyAppState createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {

  List<Icon> iconList = [];

  void addIcon({required bool givenAnswer, required int QN}){
    print('---- addIcon is called');
    bool answerMatch = quizBrain.answerChecker(givenAnswer: givenAnswer, QN: QN);

    int iconListLenght = iconList.length;
    if (iconListLenght >= 10){
      print('iconListLenght = $iconListLenght');
      print('We are removing the first icon on the list.');
      iconList.removeAt(0);
      print('iconListLenght = $iconListLenght');
    } else {
      print('iconListLenght = $iconListLenght');
      print('So we are not going to do anything');
      }

    if (answerMatch){
      print('correct icon will be added');
      setState(() {
        iconList.add(Icon(Icons.check, color: Colors.green),);
      });
    } else {
      print('wrong icon will be added');
      setState(() {
        iconList.add(Icon(Icons.close, color: Colors.red),);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Center(child: Text(quizBrain.questionText(QN: nextQuestionNumber),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),))),
          Expanded(
              flex: 1,
              child: TextButton(
                child: Container(
                  child: const Center(
                    child: Text('true',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                  width: 150,
                  height: 60,
                  color: Colors.green.shade400,
                ),
                onPressed: (){
                  print('===========>>>>> true is pressed');
                  addIcon(givenAnswer: true, QN: nextQuestionNumber);
                  setState(() {
                    nextQuestionNumber= quizBrain.questionPicker();
                  });
                  nextQuestionNumber = quizBrain.questionPicker();
                },
              ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              child: Container(
                child: const Center(
                  child: Text('false',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                ),
                width: 150,
                height: 60,
                color: Colors.red,
              ),
              onPressed: (){
                print('===========>>>>> false is pressed');
                addIcon(givenAnswer: false, QN: nextQuestionNumber);
                setState(() {
                  nextQuestionNumber = quizBrain.questionPicker();
                });
              },
            ),
          ),
          Row(children: iconList),
        ],
      ),
    );
  }
}
