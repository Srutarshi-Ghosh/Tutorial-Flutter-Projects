import 'package:flutter/material.dart';


class ChatMessage extends StatelessWidget {

    final String _name = "Jitu";
    final String text;

    ChatMessage({this.text});

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                            child: Text(_name[0]),
                        ),
                    ),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text(
                                _name,
                                style: Theme.of(context).textTheme.subhead,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(text),
                            )
                        ],
                    ),

                ],
            ),
        );
    }
}