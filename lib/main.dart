import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  // runApp(MaterialApp(
  //   home: Landing(),
  // ));
  runApp(Landing2());
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
                _buildButtonColumn(color, Icons.call, 'CALL'),
                _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
                _buildButtonColumn(color, Icons.share, 'SHARE'),
              ],
            )))
      ],
    ));

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
          'THEIHierhIHREIOHihdsoifhoid hosidhfioashoifdh disofaoifodishio'),
    );

    return MaterialApp(
      title: 'Flutter official layout demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter showcase')),
        body: ListView(children: [titleSection, buttonSection, textSection]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
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
