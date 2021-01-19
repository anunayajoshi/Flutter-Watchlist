import 'package:flutter/material.dart';
import 'package:fluttering/services/tickerdata.dart';

class ChooseTicker extends StatefulWidget {
  @override
  _ChooseTickerState createState() => _ChooseTickerState();
}

class _ChooseTickerState extends State<ChooseTicker> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void updateTicker(ticker) async {
    TickerData instance = TickerData(url: ticker);
    await instance.getPrice();
    Navigator.pop(context, {
      'price': instance.price,
      'url': instance.url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Type your ticker'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (ticker) {
              updateTicker(ticker);
            },
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input Ticker Symbol',
            ),
          ),
        ));
  }
}
