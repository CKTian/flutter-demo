
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
      // child: new Container(
      //   margin: const EdgeInsets.only(bottom: 10.0),
      //   padding: const EdgeInsets.only(
      //     left: 18.0,top: 10.0,right: 18.0,bottom: 10.0),
      //   color: Colors.white,
      //   child: new Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       new Row(
      //         children: <Widget>[
      //           new Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Padding(
      //                 padding: EdgeInsets.only(bottom: 60.0),
      //                 child: Text(
      //                   'billnumber',
      //                   style: new TextStyle(
      //                     color: Colors.black,
      //                     fontSize: 16
      //                   ),
      //                 ),
      //               ),
      //               Text(
      //                 '供应商：['+'code'+']'+'name',
      //                 style: new TextStyle(color: Colors.grey,fontSize: 12),
      //               )
      //             ],
      //           )
      //         ],
      //       ),
      //       new Container(
      //         decoration: new BoxDecoration(
      //           color: new Color(0xFFF6F6F8),
      //           borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
      //         ),
      //         padding: const EdgeInsets.only(
      //           top: 3.0,bottom: 3.0,left: 8.0,right: 8.0
      //         ),
      //         margin: const EdgeInsets.only(top: 12.0),
      //         child: Text(
      //           '下单时间：2019.11.29 02:07',
      //           style: new TextStyle(color: new Color(0xFF9fa3b0)),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
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