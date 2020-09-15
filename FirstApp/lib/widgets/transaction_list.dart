import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
	final List<Transaction> transactions;
	final Function deleteTransactions;

	TransactionList(this.transactions, this.deleteTransactions);

    @override
    Widget build(BuildContext context) {
      	return transactions.isEmpty
			? LayoutBuilder(
                builder: (ctx, constraints) {
                    return Column(
                        children: <Widget>[
                            Text(
                                "There are no Transactions yet!",
                                style: Theme.of(context).textTheme.title,
                            ),
                            Container(
                                height: constraints.maxHeight * 0.6,
                                padding: EdgeInsets.all(20),
                                child: Image.asset(
                                    "assets/images/waiting.png",
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ],
                    );
			  }
			)

			: ListView(
				children: transactions.map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx, 
                    deleteTransactions: deleteTransactions
                )).toList()
				
			);
    }
}



