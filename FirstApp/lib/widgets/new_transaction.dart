import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class NewTransaction extends StatefulWidget {
	final Function addTransaction;

	NewTransaction(this.addTransaction);

  	@override
  	_NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
	final titleController = TextEditingController();
	final ammountController = TextEditingController();
	DateTime _selectedDate;

    @override
    void initState(){
        super.initState();
    }

	void _submitData(){
		final enteredTitle = titleController.text;
		final enteredAmmount = double.parse(ammountController.text);
		if(enteredTitle.isEmpty || enteredAmmount <= 0 || _selectedDate == null)
			return;

		widget.addTransaction(enteredTitle, enteredAmmount, _selectedDate);
		Navigator.of(context).pop();
	}

	void _presentDatePicker(){
		showDatePicker(
			context: context, 
			initialDate: DateTime.now(), 
			firstDate: DateTime(2019), 
			lastDate: DateTime.now()
		).then((date) {
			if(date == null)
				return;

			setState(() {
				_selectedDate = date;
			});
		});
	}

	@override
	Widget build(BuildContext context) {
		return SingleChildScrollView(
            child: Card(
                child: Container(
                    padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[

                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Item'
                                ),
                                controller: titleController,
                                onSubmitted: (_)=> _submitData(),
                            ),

                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Ammount'
                                ),
                                controller: ammountController,
                                keyboardType: TextInputType.number,
                                onSubmitted: (_)=> _submitData(),
                            ),

                            Container(
                                height: 70,
                                child: Row(
                                    children: <Widget>[
                                        Text(
                                            _selectedDate == null
                                            ? "No Date Chosen!"
                                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'
                                        ),
                                        FlatButton(
                                            child: Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold),),
                                            textColor: Theme.of(context).primaryColor,
                                            onPressed: _presentDatePicker,
                                        )
                                    ],
                                ),
                            ),

                            RaisedButton(
                                child: Text("Add Transaction"),
                                onPressed: ()=> _submitData(),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                            ),

                        ],
                    ),
                ),
            ),
		);
	}
}