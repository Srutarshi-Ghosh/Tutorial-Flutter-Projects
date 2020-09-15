import 'package:flutter/material.dart';


class Question extends StatelessWidget {
	final String question;

	Question(this.question);

	@override
	Widget build(BuildContext context) {
		return new Container(
			margin: EdgeInsets.all(10.0),
			padding: EdgeInsets.all(20.0),
			child: new Text(question, style: new TextStyle(fontSize: 20.0, color: Colors.red), textAlign: TextAlign.center)
			
		);
	}
}