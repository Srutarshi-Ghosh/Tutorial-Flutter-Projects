import 'package:flutter/material.dart';
import './widgets/chat_screen.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Chat App",
            home: HomePage(),
        );  
    }
}


class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Frenzy Chat"),

            ),
            body: ChatScreen()
        );
  }
}
