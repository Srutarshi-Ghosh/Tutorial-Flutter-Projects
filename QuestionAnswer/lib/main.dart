import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  	var _questionIndex = 0;
	var _totalScore = 0;
    static const questionList = [{
		"questionText": "What's your favourite colour?",
		"answers": [
				{'text': "Black", 'score': 10},
				{'text': "Red", 'score': 5}, 
				{'text': "Blue", 'score': 3}, 
				{'text': "Yellow", 'score': 1}
		]},
		{"questionText": "What's your favourite animal?",
		"answers": [
			{'text': "Horse", 'score': 1}, 
			{'text': "Dog", 'score': 3}, 
			{'text': "Cat", 'score': 5}, 
			{'text': "Crocodile", 'score': 10}
		]},
		{"questionText": "What's your favourite food?",
		"answers": [
			{'text': "Momos", 'score': 5}, 
			{'text': "Biriyani", 'score': 1}, 
			{'text': "Burger", 'score': 10}, 
			{'text': "Pizza", 'score': 5}
		]}
	];

	void _getAnswers(int score){
		_totalScore += score;
		setState(() {
			_questionIndex += 1;
		});
	}

	void resetQuiz(){
		setState(() {
			_questionIndex = 0;
			_totalScore = 0;
		});
	}
	
	@override
	Widget build(BuildContext context) {
  
		return MaterialApp(
			home: new Scaffold(
				appBar: new AppBar(
					title: Text("Questions and Answers"),
				),
				body: _questionIndex < questionList.length 
					? Quiz(
						getAnswers: _getAnswers,
						questionList: questionList, 
						questionIndex: _questionIndex
					) 
					: Result(_totalScore, resetQuiz),

			),
		);
	}
}