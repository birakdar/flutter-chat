import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RecentChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index){
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (_) => ChatScreen(user: chat.sender,)
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 5.0,bottom: 5.0,right: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  decoration: BoxDecoration(
                    color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: AssetImage(chat.sender.imageUrl),
                              ),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(chat.sender.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15.0),),
                                  SizedBox(height: 5.0,),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(chat.text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 15.0),overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(chat.time,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15.0),),
                              SizedBox(height: 5.0,),
                              chat.unread ? Container(
                                width: 40.0,height: 20.0,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                alignment: Alignment.center,
                                child: Text("New",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12.0),),
                              ) : SizedBox.shrink()
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ) ;
            },
          ),
        ),
      ),
    );
  }
}
