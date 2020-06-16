import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/models/message_model.dart';


class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Favorite Contacts:",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18.0,letterSpacing: 1.0),),
                IconButton(icon: Icon(Icons.more_horiz), iconSize: 16.0, color: Colors.blueGrey, onPressed: (){})
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(
                        builder: (_) => ChatScreen(user: favorites[index])
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 6.0,),
                        Text(favorites[index].name, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 14.0),),

                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
