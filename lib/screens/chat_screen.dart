import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  _buildMessage(Message message, bool isMe) {

    final Container msg = Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe ? EdgeInsets.only(top: 8.0,bottom: 8.0,left: 80.0) : EdgeInsets.only(top: 8.0,bottom: 8.0),
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe ? BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ) : BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.text, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,color: Colors.blueGrey),),
          SizedBox(height: 8.0,),
          Text(message.time, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,color: Colors.blueGrey),),
        ],
      ),
    );
    if(isMe){
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        !isMe ? IconButton(
          icon: message.isLiked ? Icon(Icons.favorite) :  Icon(Icons.favorite_border),
          color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
          onPressed: (){},
          iconSize: 28.0,
        ) : SizedBox.shrink(),
      ],
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.attach_file), onPressed: (){}, iconSize: 25.0,color: Theme.of(context).primaryColor,),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (val){},
              decoration: InputDecoration.collapsed(hintText: "Send a message ..."),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: (){}, iconSize: 25.0,color: Theme.of(context).primaryColor,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.user.name, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25.0),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: (){}, iconSize: 28.0,color: Colors.white,),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index){
                      final message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
