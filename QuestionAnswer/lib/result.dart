import 'package:flutter/material.dart';
import './answer.dart';


class Result extends StatelessWidget {

	final int score;
	final Function resetHandler;

	Result(this.score, this.resetHandler);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Column(
			  children: <Widget>[
			    
				Text(
					"Your score is $score",
					style: new TextStyle(
						fontSize: 36,
						fontWeight: FontWeight.bold,
					),
					textAlign: TextAlign.center,
				),

				FlatButton(
					child: Text("Restart the Quiz"),
					onPressed: resetHandler,
					textColor: Colors.blue,
				)
			  
			  ],
			),
		);
	}
}