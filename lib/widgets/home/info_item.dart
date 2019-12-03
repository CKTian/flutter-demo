
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class InfoItem extends StatelessWidget {
  // final Info info;

  VoidCallback onPressed;
  Widget titleText;
  Widget messageText;
  String time;
  Widget icon;
  InfoItem({Key key, 
  // this.info,
  this.icon,
  this.titleText,
  this.messageText,
  this.time,
  this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: icon,
                  ),
                  Expanded(
                    flex:4,
                    child: titleText
                  ),
                  Expanded(
                    flex:2,
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                    child: messageText
                  ) 
                )
              ],
            )
          ],
        )
      ),
    );
  }
}