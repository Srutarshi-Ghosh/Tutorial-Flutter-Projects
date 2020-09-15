import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	double num1 = 0, num2 = 0, sum = 0;
	final TextEditingController t1 = new TextEditingController(text: '');
	final TextEditingController t2 = new TextEditingController(text: '');
	
	void addition(){
		setState(() {
			num1 = double.parse(t1.text);
			num2 = double.parse(t2.text);
		  	sum = num1 + num2;
		});
	}

	void subtraction(){
		setState(() {
			num1 = double.parse(t1.text);
			num2 = double.parse(t2.text);
		  	sum = num1 - num2;
		});
	}

	void multiplication(){
		setState(() {
			num1 = double.parse(t1.text);
			num2 = double.parse(t2.text);
		  	sum = num1 * num2;
		});
	}

	void division(){
		setState(() {
			num1 = double.parse(t1.text);
			num2 = double.parse(t2.text);
		  	sum = num1 / num2;
		});
	}

	void clear(){
		setState(() {
		  num1 = 0;
		  num2 = 0;
		  t1.text = '';
		  t2.text = '';
		});
	}

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
			resizeToAvoidBottomPadding: false,
            appBar: new AppBar(title: new Text("Calculator"),),
            body: new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                
                    children: <Widget>[

						new Text(
							"Output: $sum",
							style: new TextStyle(
								fontSize: 20.0,
								fontWeight: FontWeight.bold
							),
						),

                        new TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                hintText: "Enter Number"
                            ),
							controller: t1,
                        ),

                        new TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                hintText: "Enter Number"
                            ),
							controller: t2,
                        ),

						new Padding(padding: new EdgeInsets.only(top: 20.0)),

						new Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							
							children: <Widget>[

								new MaterialButton(
									child: new Text("+"),
									color: Colors.greenAccent,
									onPressed: addition
								),

								new MaterialButton(
									child: new Text("-"),
									color: Colors.greenAccent,
									onPressed: subtraction
								),

							],
						),

						new Padding(padding: new EdgeInsets.only(top: 15.0)),

						new Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[

								new MaterialButton(
									child: new Text("*"),
									color: Colors.greenAccent,
									onPressed: multiplication
								),

								new MaterialButton(
									child: new Text("/"),
									color: Colors.greenAccent,
									onPressed: division
								),

							],
						),

						new Padding(padding: EdgeInsets.only(top: 20.0)),

						new Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								new MaterialButton(
									child: new Text("CLEAR"),
									color: Colors.greenAccent,
									onPressed: clear
								),
							]
							
						)

                    ],
                ),
            )
        );
    }
}

