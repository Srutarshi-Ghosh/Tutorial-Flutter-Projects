import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
	final String label;
	final double spending;
	final double spendngPercentage;

	ChartBar(this.label, this.spending, this.spendngPercentage);
	
	@override
	Widget build(BuildContext context) {
		return LayoutBuilder(
            builder: (ctx, constraints) {
                return Column(
                    children: <Widget>[
                        
                        Container(
                            height: constraints.maxHeight * 0.15,
                            child: FittedBox(
                                child: Text("${spending.toStringAsFixed(0)}")
                            ),
                        ),

                        SizedBox(height: constraints.maxHeight * 0.05),
                        
                        Container(
                            width: 10,
                            height: constraints.maxHeight * 0.6,
                            child: Stack(
                                children: <Widget>[
                            
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey, width: 2),
                                            color: Color.fromRGBO(220, 220, 220, 1),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                    ),

                                    FractionallySizedBox(
                                        heightFactor: spendngPercentage,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                        ),
                                    )

                                ],
                            ),
                        ),
                        
                        SizedBox(height: constraints.maxHeight * 0.05),
                        
                        Container(
                            height: constraints.maxHeight * 0.15,
                            child: FittedBox(
                                child: Text(label)
                            )
                        ),

                    ],
                );
            },
        ); 
	}
}