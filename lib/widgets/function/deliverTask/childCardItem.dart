import 'package:flutter/material.dart';

class ChildCardItem extends StatelessWidget{

  String companyName;
  String name;
  String phone;
  String address;
  String iconText;
  Color iconColor;

  ChildCardItem({this.companyName, this.name, 
  this.phone, this.address,this.iconText,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 5, 10,10),
            decoration: new BoxDecoration(
              border:Border(
                bottom: BorderSide(width: 0.8,color: Colors.grey[200])
              ), //底部border
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  padding: EdgeInsets.only(top: 2,bottom:5),
                  color:iconColor,
                  child: Text(iconText,style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(companyName),
                            Text(name+" "+phone,
                              style: TextStyle(
                                color: Colors.grey
                              )
                            ),
                            Text(address,
                              style: TextStyle(
                                color: Colors.grey
                              )
                            ),
                          ],
                        ),
                      ),
                      Container( 
                        child:  Icon(Icons.call,color: Colors.grey,),
                      ),
                      Container( 
                        margin: EdgeInsets.only(left:2),
                        alignment: Alignment.centerRight,
                        child:  Icon(Icons.location_on,color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  
}