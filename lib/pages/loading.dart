import 'package:flutter/material.dart';
import 'package:fluttering/services/tickerdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupTicker() async {
    TickerData instance = TickerData(url: 'AMZN');
    await instance.getPrice();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'price': instance.price, 'url': instance.url,
    });


  }

  @override
  void initState() {
    super.initState();
    setupTicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }
}
