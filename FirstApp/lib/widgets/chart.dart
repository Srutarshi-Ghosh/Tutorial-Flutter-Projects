import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';


class Chart extends StatelessWidget {

	final List<Transaction> recentTransactions;
	Chart(this.recentTransactions);

	List<Map<String, Object>> get groupedTransactionValues{
		
		return List.generate(7, (index) {
			final weekDay = DateTime.now().subtract(Duration(days: index));
			double totalSum = 0.0;

			for(int i = 0; i < recentTransactions.length; i++){
				var date = recentTransactions[i].date;
				if(date.day == weekDay.day && date.month == weekDay.month && date.year == weekDay.year)
					totalSum += recentTransactions[i].ammount;
			}

			return {'day': DateFormat.E().format(weekDay), 'ammount': totalSum};
		}).reversed.toList();
	}

	double get maxSpending{
		return groupedTransactionValues.fold(0.0, (sum, item) {
			return sum + item['ammount'];
		});
	}

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 6,
			margin: EdgeInsets.all(20),
			child: Container(
				padding: EdgeInsets.all(10),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceAround,
					children: groupedTransactionValues.map((data) {
						double spendingPercentage = data['ammount'] == 0.0 ? 0.0 : (data['ammount'] as double) / maxSpending;
						return Flexible(
							fit: FlexFit.tight,
							child: ChartBar(data['day'], data['ammount'], spendingPercentage)
						);
					}).toList(),
				),
			),
		);
	}
}