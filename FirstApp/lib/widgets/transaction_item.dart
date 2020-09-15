import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatefulWidget {
    const TransactionItem({
        Key key,
        @required this.transaction,
        @required this.deleteTransactions
    }) : super(key: key);

    final Transaction transaction;
    final Function deleteTransactions;

    @override
    _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

    Color _bgColor;

    @override
    void initState(){
        const colorsList = [Colors.red, Colors.blue, Colors.purple, Colors.yellow];
        _bgColor = colorsList[Random().nextInt(4)];
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: _bgColor,
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('Rs ${widget.transaction.ammount}')
                        ),
                    ),
                ),
                title: Text(
                    widget.transaction.title,
                    style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
                trailing: MediaQuery.of(context).size.width > 450 
                    ? FlatButton.icon(
                        icon: Icon(Icons.delete),
                        label: Text("Delete"),
                        textColor: Theme.of(context).errorColor,
                        onPressed: ()=> widget.deleteTransactions(widget.transaction.id),
                    )
                    : IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: ()=> widget.deleteTransactions(widget.transaction.id),
                    ),
            ),
        );
    }
}