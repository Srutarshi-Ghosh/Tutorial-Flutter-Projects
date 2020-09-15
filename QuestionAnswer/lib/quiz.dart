import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';


class Quiz extends StatelessWidget {

	final Function getAnswers;
	final int questionIndex;
 	final List<Map<String, Object>> questionList;

	Quiz({
		@required this.getAnswers, 
		@required this.questionList,
		@required this.questionIndex
		});

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[

				Question(questionList[questionIndex]['questionText']),
				...(questionList[questionIndex]['answers'] as List<Map<String, Object>>).map((answer)=> Answer(()=> getAnswers(answer['score']), answer['text'])).toList()
			
			],
		);
	}
}