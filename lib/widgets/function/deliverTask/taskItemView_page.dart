import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iwms_demo/widgets/function/deliverTask/TaskState.dart';

class TaskItemView extends StatelessWidget {
  String paramsNumber;

  TaskItemView({this.paramsNumber});

  Map item ={
    "state":TaskState.APPROVED
  };

  // @override
  // _TaskItemViewState createState() => _TaskItemViewState();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
        appBar:AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          title: Text(paramsNumber),
          centerTitle: true,
          actions: <Widget>[
            new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Text('线路监控')
                // onTap: this.rightClick, 查询
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    color:TaskStateName(item["state"],context)["color"],
                    child:Row(
                      children: <Widget>[
                        Text("该配送任务 "+TaskStateName(item["state"],context)["caption"]),
                        Container(
                          margin: EdgeInsets.only(left: 230),
                          child: Icon(
                            Icons.keyboard_arrow_right
                          ),
                        )
                      ],
                    ) 
                  )
                ),
              ],
            ),
            Container(
              height: 200.0,
              child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 20, 0),
                                child: Row(
                                  children: <Widget>[
                                    Text((index+1).toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      child: Text(' / '+3.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(245, 15, 15, 0),
                                child: Text("未开始",style: TextStyle(color: Colors.grey),),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 25,
                                height: 25,
                                margin: EdgeInsets.only(top:10,left:15),
                                padding: EdgeInsets.only(top: 2,bottom:5),
                                color: Colors.lightGreenAccent[700],
                                child: Text("源",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  border:Border(
                                    bottom: BorderSide(width: 0.8,color: Colors.grey[200])
                                  ), //底部border
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text("上海杏花楼食品有限公司"),
                                          Text("王老板 13080828331"),
                                          Text("上海市闵行区浦江镇联航路100号"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child:  Icon(Icons.call,color: Colors.grey,),
                                    ),
                                    Container(
                                      child:  Icon(Icons.location_on,color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 25,
                                height: 25,
                                margin: EdgeInsets.only(top:10,left:15),
                                padding: EdgeInsets.only(top: 2,bottom:5),
                                color: Colors.grey,
                                child: Text("目",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  border:Border(
                                    bottom: BorderSide(width: 0.8,color: Colors.grey[200])
                                  ), //底部border
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text("上海杏花楼食品有限公司"),
                                          Text("王老板 13080828331"),
                                          Text("上海市闵行区浦江镇联航路100号"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child:  Icon(Icons.call,color: Colors.grey,),
                                    ),
                                    Container(
                                      child:  Icon(Icons.location_on,color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  duration: 300,
                  control:null,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 100,bottom:0.0,),
                    builder: SwiperPagination.dots
                  ),
                  autoplayDisableOnInteraction : true
              ),
            )
          ],
        ),
    );
  }
}

