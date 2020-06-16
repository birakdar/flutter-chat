import 'package:chat/models/message_model.dart';
import 'package:chat/widgets/category_selector.dart';
import 'package:chat/widgets/favorite_contacts.dart';
import 'package:chat/widgets/recent_chats.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu,), onPressed: (){}, iconSize: 28.0,color: Colors.white,),
        title: Text("Chats", style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}, iconSize: 28.0,color: Colors.white,),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChat(),
                  ]
              )
            ),
          )
        ],
      )
    );
  }
}
