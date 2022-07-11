import 'package:expanse_tracker/widgets/new_transaction.dart';
import 'package:expanse_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTrans = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      price: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Coat',
      price: 75.49,
      date: DateTime.now(),
    )
  ];
  void _addNewTrans(String title, double amount) {
    final newTx = Transaction(
      title: title,
      price: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTrans.add(newTx);
    });
  }

  // String? amountInput;
  void _startAnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTrans);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Expanse Tracker',
        ),
        actions: [
          IconButton(
              onPressed: ((() => _startAnewTransaction(context))),
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.green,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTrans)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
        onPressed: () => _startAnewTransaction(context),
      ),
    );
  }
}
