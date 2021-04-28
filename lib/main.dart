import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import './widgets/RecipeThumbnail.dart';

void main() {
  runApp(MaterialApp(
    home: Landing2(),
    routes: <String, WidgetBuilder>{
      '/accounts': (BuildContext context) =>
          AccList(email: 'email', password: 'password'),
      '/recipes': (BuildContext context) => Recipes(),
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
                    color, Icons.near_me, 'MEAL', context, 'recipes'),
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

class Recipes extends StatelessWidget {
  final List<Map> recipes = [
    {
      'name': 'Baked Chicken Breast',
      'image': 'recipe_baked_chicken_breast.jpeg'
    },
    {'name': 'Taco', 'image': 'recipe_taco.jpeg'},
    {'name': 'Taco', 'image': 'recipe_taco.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: Text('Recipes',
              // style: TextStyle(color: Colors.black),
            ),
            // elevation: 0,
            // backgroundColor: Colors.transparent,
            // iconTheme: IconThemeData(
            //   color: Colors.black
            // ),
            flexibleSpace: Image(
              image: AssetImage('lib/assets/images/Repeating-Triangles.jpg'),
              fit: BoxFit.cover,
            )
          ),
        body: ListView(children: [
          Column(
            children: new List.generate(
                recipes.length,
                (index) => Row(children: [
                      // IndRecipe(dishName: recipes[index]['name'], imageName: recipes[index]['image'])
                      RecipeThumbnail(dishName: recipes[index]['name'], imagePath: recipes[index]['image'])
                    ])),
          )
        ]));
  }
// #fe3465#4fcdbe#ec8f6e
// light purple: #ba77ff
// light blue: #01b9ff
// light green: #73dbcf

  Expanded _indRecipe(String dishName, String imageName) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 4))
                ]),
            child: Stack(children: <Widget>[
              Positioned.fill(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        'lib/assets/images/Colorful-Stingrays.svg',
                        // color: Colors.,
                        fit: BoxFit.cover,
                      ))),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        dishName.toUpperCase(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                        )
                    ),
                    Stack(children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('lib/assets/images/' + imageName,
                            width: 300, height: 200, fit: BoxFit.cover),
                      ),
                      Container(
                        height: 220,
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_downward),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: (){}
                          ),
                      ))
                    ])
                  ],
                ),
              )
            ]
          )
        )
      );
  }
}


class IndRecipe extends StatefulWidget {
  final String dishName, imageName;

  IndRecipe({Key key, this.dishName, this.imageName}) : super(key: key);

  @override
  _IndRecipeState createState() => _IndRecipeState();
}
class _IndRecipeState extends State<IndRecipe> {

  bool expanded = false;

  @override
  void initState() {
    super.initState();
    expanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 4))
                ]),
            child: Stack(children: <Widget>[
              Positioned.fill(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        'lib/assets/images/Colorful-Stingrays.svg',
                        // color: Colors.,
                        fit: BoxFit.cover,
                      ))),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        widget.dishName.toUpperCase(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                        )
                    ),
                    Stack(children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('lib/assets/images/' + widget.imageName,
                            width: 300, height: 200, fit: BoxFit.cover),
                      ),
                      // ExpansionTile(title: Text('re'), ),
                      Container(
                        height: 220,
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue.withOpacity(0.7),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_downward),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: (){
                              setState(() {
                                expanded = !expanded;
                              });
                            }
                          ),
                      ))
                    ]),
                  ],
                ),
              )
            ]
          )
        )
      );
    }
}
