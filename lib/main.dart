import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'dart:developer';

void main() {
  runApp(MaterialApp(
    home: Landing2(),
    routes: <String, WidgetBuilder>{
      '/accounts': (BuildContext context) =>
          AccList(email: 'email', password: 'password')
    },
  ));
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey[900],
            child: Text('dd'),
          ),
        ),
        Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
              color: Colors.grey[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Box(),
                      Box(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Box(),
                      Box(),
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10),
      width: 80.0,
      height: 80.0,
      child: Center(
        child: Text('HEY'),
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border.all(
            color: Colors.lightBlue,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class Landing2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Reichsburg - Fachwerk',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  'Germany',
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.green[300],
          ),
          Text('41')
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('lib/assets/images/stonks.jpeg',
            width: 400, height: 240, fit: BoxFit.cover),
        Container(
            padding: EdgeInsets.all(16),
            child: (Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonColumn(
                    color, Icons.call, 'ACCT', context, 'accounts'),
                _buildButtonColumn(
                    color, Icons.near_me, 'MEAL', context, 'accounts'),
                _buildButtonColumn(
                    color, Icons.share, 'SHARE', context, 'accounts'),
              ],
            )))
      ],
    ));

    return Scaffold(
      appBar: AppBar(title: Text('Flutter showcase')),
      body: ListView(children: [titleSection, buttonSection]),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label,
      BuildContext context, String routeName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: color,
          onPressed: () {
            Navigator.pushNamed(context, '/' + routeName);
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class AccList extends StatelessWidget {
  AccList({@required this.email, @required this.password});

  final email, password;

  @override
  Widget build(BuildContext context) {
    Widget account = Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Google'),
          Text(email),
          Text(password),
        ],
      ),
    );

    Widget account2 = Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('lib/assets/images/icon_google.png',
              width: 40, height: 40, fit: BoxFit.cover),
          Text(email),
          Text(password),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Column(
        children: [account2],
      ),
    );
  }
}
