import 'package:ChatApp/widgets/chat_message.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
    @override
    _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
    final TextEditingController _textController = new TextEditingController();
    String text = "";
    final List<ChatMessage> messages = [];

    void _handleSubmitted(String txt){
        text = _textController.text;
        _textController.clear();
        ChatMessage message = new ChatMessage(text: text);

        setState(() {
            messages.insert(0, message);
        });
    }


    Widget _textComposeWidget(){
        return IconTheme(
            data: IconThemeData(color: Colors.blue),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                    children: <Widget>[
                        
                        Flexible(
                            child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "Send a Message",
                                ),
                                controller: _textController,
                                onSubmitted: _handleSubmitted,
                            ),
                        ),

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.0,),
                            child: IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () => _handleSubmitted(_textController.text),
                            ),
                        )

                    ],
                ),
            ),
        );
    }
    

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Flexible(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        reverse: true,
                        itemBuilder: (_, index) {
                            return messages[index];
                        }, 
                        itemCount: messages.length,
                    ),
                ),

                Divider(height: 1),

                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor
                    ),
                    child: _textComposeWidget(),
                )
            ],
        );
    }
}