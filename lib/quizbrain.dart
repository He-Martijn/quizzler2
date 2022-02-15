//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'question.dart';

class QuizBrain {

  // Questions are directly copied from https://github.com/londonappbrewery/quizzler-flutter/blob/master/README.md
  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),

  ];

  List<Icon> iconList = [];

  bool _answerChecker({required bool givenAnswer, required int QN}) {
    print('----- answerChecker is called');

    bool correctAnswer = _questionBank[QN].questionAnswer;
    print('The correct answers is $correctAnswer');
    print('The given answers is $givenAnswer');

    if (givenAnswer == correctAnswer) {
      print('The answer is correct');
      return true;
    } else {
      print('The answer is wrong');
      return false;
    }
  }

  int questionPicker(){
    print('----- questionPicker is called');
    //int amountOfQuestions = QL.length;
    int amountOfQuestions = _questionBank.length;
    print('amountOfQuestions = $amountOfQuestions');
    int questionNumber = Random().nextInt(amountOfQuestions);
    print('questionNumber = $questionNumber');

    return questionNumber;
  }

  String questionText({required int QN}){

    String question = _questionBank[QN].questionText;

    return question;
  }

  void addIcon({required bool givenAnswer, required int QN}){
    print('---- addIcon is called');
    bool answerMatch = _answerChecker(givenAnswer: givenAnswer, QN: QN);

    int iconListLenght = iconList.length;
    if (iconListLenght >= 10){
      print('iconListLenght = $iconListLenght');
      print('We are removing the first icon on the list.');
      iconList.removeAt(0);
      print('iconListLenght = $iconListLenght');
    } else {
      print('iconListLenght = $iconListLenght');
      print('So we are not removing icons from the list');
    }

    if (answerMatch){
      print('correct icon will be added');
      iconList.add(Icon(Icons.check, color: Colors.green),);
    } else {
      print('wrong icon will be added');
      iconList.add(Icon(Icons.close, color: Colors.red),);
    }

  }




}

