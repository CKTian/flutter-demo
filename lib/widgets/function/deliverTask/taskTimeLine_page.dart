import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'lineItem.dart';

class TaskTimeLine extends StatelessWidget{
  String paramsNumber;

  TaskTimeLine({this.paramsNumber});

  List infoList = [
    {"time":"今天 18:12:11","message":"配送任务完成"},
    {"time":"今天 12:59:12","message":"完成交接","companyName":"上海杏花楼食品有限公司","name":"王静香","phone":"13080828331","address":"上海市联航路100号"},
    {"time":"今天 11:23:22","message":"完成交接","companyName":"良友863软件园店","name":"王静香","phone":"13080828331","address":"上海市闵行联航路12号"},
    {"time":"今天 11:15:56","message":"完成交接","companyName":"全家江月路店","name":"王静香","phone":"13080828331","address":"上海市闵行区北江燕路152号"},
    {"time":"今天 09:33:04","message":"完成装车"},
    {"time":"今天 08:05:36","message":"生成排车单"}
  ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        title:Text('返回'),
        centerTitle:false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20,left: 20),
            child: Text(paramsNumber,style: TextStyle(
              fontSize: 18
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: infoList.length,
                itemBuilder: (context,index){
                  List<Widget> list =[
                    Text(infoList[index]["time"]+" "+infoList[index]["message"],style: TextStyle(
                      fontSize: 15
                    ))
                  ];
                  if(infoList[index].containsKey('companyName')){
                    list.add(
                      Text(infoList[index]["companyName"],style: TextStyle(
                        color: Colors.grey
                      ))
                    );
                  }
                  if(infoList[index].containsKey('name')&&infoList[index].containsKey('phone')){
                    list.add(
                      Text(infoList[index]["name"]+' '+infoList[index]["phone"],style: TextStyle(
                        color: Colors.grey
                      ))
                    );
                  }
                  if(infoList[index].containsKey('address')){
                    list.add(
                      Text(infoList[index]["address"],style: TextStyle(
                        color: Colors.grey
                      ))
                    );
                  }
                  return LineItem(
                    info:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: list
                    ),
                    index: index,
                    totalLength:infoList.length
                  );
                },
              ),
            )
          )
        ],
      ),
    );
  }
}