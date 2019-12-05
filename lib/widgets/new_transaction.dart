import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function submitFunction;

  NewTransaction(this.submitFunction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount =
        enteredTitle.isEmpty ? 0 : double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.submitFunction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
