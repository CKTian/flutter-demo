import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iwms_demo/widgets/function/deliverTask/TaskState.dart';
import 'package:iwms_demo/widgets/function/deliverTask/childCardItem.dart';
import 'package:iwms_demo/widgets/function/deliverTask/taskItemList.dart';
import 'package:iwms_demo/widgets/function/deliverTask/taskTimeLine_page.dart';

class TaskItemView extends StatelessWidget {
  String paramsNumber;

  TaskItemView({this.paramsNumber});

  Map item ={
    "state":TaskState.APPROVED,
    "qtyStr":"100",
    "amount":"1000.00元",
    "weight":"10.124吨",
    "volumn":"13230.123 m3",
    "vehicle":"闽AV9P16",
    "carrier":"汇宁",
    "driver":"刘昊然",
    "phone":"13080828331",
    "childItems":[
      {
        "startCompanyName":"上海杏花楼食品有限公司",
        "startName":"王老板",
        "startPhone":"13080828331",
        "startAddress":"上海市闵行区浦江镇联航路100号",
        "endAddress":"上海市闵行区浦江镇陈行公路12号",
        "endPhone":"15142076558",
        "endName":"李老板",
        "endCompanyName":"家乐福华侨城",
      },
      {
        "startCompanyName":"上海杏花楼食品有限公司",
        "startName":"王老板",
        "startPhone":"13080828331",
        "startAddress":"上海市闵行区浦江镇联航路100号",
        "endAddress":"上海市闵行区浦江镇江文路32号",
        "endPhone":"17721271629",
        "endName":"张老板",
        "endCompanyName":"良友863软件园店",
      },
      {
        "startCompanyName":"上海杏花楼食品有限公司",
        "startName":"王老板",
        "startPhone":"13080828331",
        "startAddress":"上海市闵行区浦江镇联航路100号",
        "endAddress":"上海市闵行区北江燕路12号",
        "endPhone":"18018825845",
        "endName":"林老板",
        "endCompanyName":"罗森便利店",
      }
    ]
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
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>new TaskTimeLine(
                        paramsNumber:paramsNumber
                      )
                    )
                  );
                },
              ),
            ],
          ),
          Container(
            height: 255.0,
            child: Swiper(
              itemCount: item["childItems"].length,
              scrollDirection: Axis.horizontal,
              duration: 300,
              control:null,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 100,bottom:0.0,),
                builder: SwiperPagination.dots
              ),
              autoplayDisableOnInteraction : true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 20, 0),
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
                            margin: EdgeInsets.fromLTRB(240, 5, 15, 0),
                            child: Text("未开始",style: TextStyle(color: Colors.grey),),
                          )
                        ],
                      ),
                      ChildCardItem(
                        companyName:item["childItems"][index]["startCompanyName"],
                        name:item["childItems"][index]["startName"],
                        phone:item["childItems"][index]["startPhone"],
                        address:item["childItems"][index]["startAddress"],
                        iconText:"源",
                        iconColor: Colors.lightGreenAccent[700]
                      ),
                      ChildCardItem(
                        companyName:item["childItems"][index]["endCompanyName"],
                        name:item["childItems"][index]["endName"],
                        phone:item["childItems"][index]["endPhone"],
                        address:item["childItems"][index]["endAddress"],
                        iconText:"目",
                        iconColor: Colors.grey
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 20,right: 20,top:0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(69, 118, 255, 1),
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Center(
                                child: Text("配送详情",style: TextStyle(
                                  color: Colors.white
                                )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          TaskItemList(
            title:"装车信息",
            list:[
              {"name":"件数","value":item["qtyStr"]},
              {"name":"金额","value":item["amount"]},
              {"name":"重量","value":item["weight"]},
              {"name":"体积","value":item["volumn"]}
            ]
          ),
          TaskItemList(
            title:"承运信息",
            list:[
              {"name":"车辆","value":item["vehicle"]},
              {"name":"承运商","value":item["carrier"]},
              {"name":"司机","value":item["driver"]+item["phone"]},
              {"name":"卸货员","value":item["driver"]+item["phone"]}
            ]
          ),
        ],
      ),
    );
  }
}

