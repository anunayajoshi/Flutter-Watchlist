import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data =  {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      backgroundColor: Colors.grey[400],
      //appBar: AppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget> [
          Container(
            margin: EdgeInsets.all(5.0),
            color: Colors.grey[600],
            child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/ticker');
                    setState(() {
                      data = {
                        'price': result['price'],
                        'url': result['url'],
                      };
                    });
                  },
                  icon: Icon(Icons.addchart),
                  label: Text(
                      'Choose Your Ticker'
                  )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['url'].toString(),
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                  data['price'].toString(),
                  style: TextStyle(
                    fontSize: 40.0,
                  )
              ),
            ],
        ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            color: Colors.grey[600],
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/ticker');
                      setState(() {
                        data = {
                          'price': result['price'],
                          'url': result['url'],
                        };
                      });
                    },
                    icon: Icon(Icons.addchart),
                    label: Text(
                        'Choose Your Ticker'
                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['url'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                    data['price'].toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                    )
                ),
              ],
            ),
          ),

        ],

      ),
    );
  }
}