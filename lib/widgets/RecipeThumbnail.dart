import 'package:flutter/material.dart';

class RecipeThumbnail extends StatelessWidget {

  final String imagePath, dishName;
  RecipeThumbnail({@required this.imagePath, @required this.dishName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // backgroundBlendMode: BlendMode.darken,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          image: AssetImage('lib/assets/images/' + imagePath),
          fit: BoxFit.cover
        )
      ),
      width: 200,
      height: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dishName,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: ElevatedButton(
              style: ButtonStyle(
                // backgroundColor: Colors.white
                
              ),
              onPressed: (){}, 
              child: Text(
                'Get Cooking',
                style: TextStyle(
                  color: Colors.grey[800]
                ),
              )
            ),
          )
        ],
      )
    );
  }
}