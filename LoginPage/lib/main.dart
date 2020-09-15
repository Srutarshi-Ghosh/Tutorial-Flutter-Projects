import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());


class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
        home: new Loginpage(),
        theme: new ThemeData(
            primarySwatch: Colors.blue
        ),
        );
    }
}


class Loginpage extends StatefulWidget {
    @override
    _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with SingleTickerProviderStateMixin{


    AnimationController _iconAnimationController;
    Animation<double> _iconAnimation;

    @override
    void initState() {
        super.initState();
        _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 300),
        );
        _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceInOut);
        _iconAnimation.addListener(() => this.setState(() { }));
        _iconAnimationController.forward();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.greenAccent,
            body: new Stack(
                fit: StackFit.expand,
                children: <Widget>[

                    new Image(
                        image: new AssetImage('images/GarkagoDragon.jpg'),
                        fit: BoxFit.cover,
                        color: Colors.black87,
                        colorBlendMode: BlendMode.darken,
                    ),

                    new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                            new FlutterLogo(
                                size: _iconAnimation.value * 100,
                            ),

                            new Form(
                                child: new Theme(
                                    data: new ThemeData(
                                        brightness: Brightness.dark,
                                        primarySwatch: Colors.teal,
                                        inputDecorationTheme: new InputDecorationTheme(
                                        labelStyle: new TextStyle(color: Colors.teal, fontSize: 20.0)
                                        )
                                    ),

                                    child: new Container(
                                        padding: const EdgeInsets.all(40.0),
                                        child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[

                                                new TextFormField(
                                                    decoration: new InputDecoration(
                                                        labelText: "EMAIL"
                                                    ),
                                                    keyboardType: TextInputType.emailAddress,
                                                ),

                                                new TextFormField(
                                                    decoration: new InputDecoration(
                                                        labelText: "PASSWORD",
                                                        fillColor: Colors.white
                                                    ),
                                                    keyboardType: TextInputType.text,
                                                    obscureText: true,
                                                ),

                                                new Padding(padding: const EdgeInsets.only(top: 30.0)),

                                                new MaterialButton(
                                                    height: 40.0,
                                                    minWidth: 100.0,
                                                    color: Colors.green,
                                                    textColor: Colors.white,
                                                    child: new Icon(Icons.arrow_right, size: 40.0,),
                                                    onPressed: () {},
                                                    splashColor: Colors.redAccent,
                                                ),
                                                
                                            ],  
                                        ),
                                    )
                                )
                            )
                        ],
                    )
                ],
            ),
        );
    }
}