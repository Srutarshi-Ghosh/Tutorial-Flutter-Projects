import 'dart:io';

import 'package:FirstApp/widgets/new_transaction.dart';
import 'package:FirstApp/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
    // WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    runApp(MyApp());
}


class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Personal Expenses",
			theme: ThemeData(
				primarySwatch: Colors.purple,
				accentColor: Colors.amber,
				fontFamily: 'Quicksand',
				appBarTheme: AppBarTheme(
					textTheme: ThemeData.light().textTheme.copyWith(
						title: TextStyle(
							fontFamily: 'OpenSans',
							fontSize: 20,
							fontWeight: FontWeight.bold,
						),
						button: TextStyle(
							color: Colors.white,
						)
					)
				)
			),
			home: HomePage(),
		);
	}
}

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	final List<Transaction> userTransaction = [];
    bool _showchart = true;
	List<Transaction> get _recentTransactions{
		return userTransaction.where((tx){
			return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
		}).toList();
	} 

	void newTransaction(String title, double ammt, DateTime chosenDate){
		final newTx = Transaction(title: title, ammount: ammt, date: chosenDate, id: userTransaction.length + 1);
		setState(() {
			userTransaction.add(newTx);
		}); 
	}

	void _startAddNewTransaction(BuildContext ctx){
		showModalBottomSheet(
			context: ctx, 
			builder: (_) {
				return GestureDetector(
					onTap: () {},
					child: NewTransaction(newTransaction),
					behavior: HitTestBehavior.opaque,
				);
			}
		);
	}

	void _deleteTransaction(int id){
		setState(() {
			userTransaction.removeWhere((tr) => tr.id == id);
		});
	}

    List<Widget> buildLandscapeContent(MediaQueryData mediaQuery, AppBar appBar, Widget transactionListWidget){
        return [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text("Show Chart"),
                    Switch.adaptive(
                        activeColor: Theme.of(context).accentColor,
                        value: _showchart,
                        onChanged: (value){
                            setState(() {
                                _showchart = value;
                            });
                        },
                    )
                ]
            ),
            _showchart
                ? Container(
                    height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
                    child: Chart(_recentTransactions)
                )
                : transactionListWidget,
        ];
    }

    List<Widget> buildPortraitContent(MediaQueryData mediaQuery, AppBar appBar, Widget transactionListWidget){
        return [
                Container(
                height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.3,
                child: Chart(_recentTransactions)
            ),
            transactionListWidget
        ];
    }


	@override
	Widget build(BuildContext context) {
        final mediaQuery = MediaQuery.of(context);
        bool isLandscape = mediaQuery.orientation == Orientation.landscape;
		final PreferredSizeWidget appBar = Platform.isIOS
            ? CupertinoNavigationBar(
                middle: Text("Personal Expenses"),
                trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        GestureDetector(
                            onTap: ()=> _startAddNewTransaction(context),
                            child: Icon(CupertinoIcons.add),
                        ) 
                    ],
                ),
            )
            : AppBar(
                title: Text("Personal Expenses"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: ()=> _startAddNewTransaction(context),
                    ),
                ],
		    );
            
        final transactionListWidget =  Container(
            height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
            child: TransactionList(userTransaction, _deleteTransaction)
        );
        final pageBody = SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[                            

                        if (!isLandscape) ...buildPortraitContent(mediaQuery, appBar, transactionListWidget),
                        
                        if(isLandscape) ...buildLandscapeContent(mediaQuery, appBar, transactionListWidget),
                            
                    ],
                ),
            )
        );

		return Scaffold(
			resizeToAvoidBottomInset: false,
			appBar: appBar,
			body: pageBody,
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
			floatingActionButton: Platform.isIOS 
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: ()=> _startAddNewTransaction(context),
                ),
		);
	}
}

