import 'package:flutter/material.dart';

class TaskItemList extends StatelessWidget{

  List list;
  String title;

  TaskItemList({this.list,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177,
      margin: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180*0.15,
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(title,style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),),
          ),
          Column(
            children: list.map((info){
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  border:Border(
                    bottom: BorderSide(width: 0.8,color: Colors.grey[200])
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                        alignment: Alignment.centerLeft,
                        child: new Text(info["name"]),
                      )
                    ),
                    Expanded(
                      child: new Container(
                        alignment: Alignment.centerRight,
                        child: new Text(info["value"]),
                      )
                    )
                  ],
                ),
              );
            }).toList()
          )
        ],
      ),
    );
  }
}