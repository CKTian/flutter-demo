import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'home/info_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  final List bussinessInfoList =[
    // {'vehicleName':'闽AV9P16','time':'今天 09:12:08','shipBillNumber':'FJHN1910130000001'},
    // {'vehicleName':'闽AV9P22','time':'今天 10:15:33','shipBillNumber':'FJHN1910130000002'}
  ];

  final List noticeInfoList = [
    {'org':'配送中心','message':'配送中心工作时间调整公告','time':'今天 09:56:28'},
    {'org':'配送中心','message':'配送中心工作时间调整公告','time':'今天 15:15:21'},
    {'org':'配送中心','message':'配送中心工作时间调整公告','time':'今天 17:35:15'},
  ];

  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        new Scaffold(
          backgroundColor:Color.fromRGBO(69, 118, 255, 1.0),
          body: new Column(
            children: <Widget>[
              new Stack(
                fit: StackFit.loose,
                overflow: Overflow.clip,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(20,45,0,70),
                        child:new CircleAvatar(
                            radius: 35.0,
                            backgroundImage:  new AssetImage('images/touxiang01.jpg'),
                          ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(20,40,0,70),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,// 主轴
                          crossAxisAlignment: CrossAxisAlignment.start,// 交叉轴
                          children: [
                            new Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                left: 0,
                                bottom: 0
                              ),
                              child: new Text(
                                '上海杏花楼有限公司',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0
                                ),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                              child: new Text(
                                "10004",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            )
                          ],
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(60,0,0,50),
                        child: new IconButton(
                          color:Colors.white,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   new MaterialPageRoute(builder: (context) => new Search()),
                            // );
                          }
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: new IconButton(
                          color: Colors.white,
                          icon: ImageIcon(AssetImage("images/ic_saomiao.png")),
                          onPressed: () {
                            
                          }),
                      )
                    ],
                  ),
                ],
              ),
              new Expanded(
                child: new Container(
                  padding: const EdgeInsets.only(top: 65,left:20,right: 20),
                  color: Colors.grey[100],
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child:Text(
                              FlutterI18n.translate(context, "homeBussinessInfo"),
                              style:TextStyle(color: Colors.grey[800])
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FlutterI18n.translate(context, "homeMore"),
                              textAlign:TextAlign.right,
                              style:TextStyle(
                                color: Colors.grey[800],
                              )
                            ),
                          ),
                        ],
                      ),
                      Column (
                        children: (bussinessInfoList.length>0)?bussinessInfoList.map((info){
                            return InfoItem(
                              icon:Icon(Icons.chat,color: Colors.grey),
                              titleText:Text(
                                FlutterI18n.translate(context, "homeVehicleBeginLoading",
                                Map.fromIterables(["vehicleName"], [info["vehicleName"]])),
                              ),
                              time:info["time"],
                              messageText:Text(
                                FlutterI18n.translate(context, "homeToRead",
                                Map.fromIterables(["billNumber"], [info["shipBillNumber"]])
                                ),
                              ),
                            );
                          }).toList():[
                            Column(
                              children:<Widget>[
                                Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.grey,
                                ),
                                Container(
                                  // width: 100,
                                  height: 50,
                                  child: Center(
                                    child:Text(
                                      FlutterI18n.translate(context, "homeNoMessage"),
                                      style:TextStyle(color: Colors.grey)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child:Text(
                              FlutterI18n.translate(context, "homeNoticeInfo"),
                              style:TextStyle(color: Colors.grey[800])
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FlutterI18n.translate(context, "homeMore"),
                              textAlign:TextAlign.right,
                              style:TextStyle(
                                color: Colors.grey[800],
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children:noticeInfoList.map((info){
                          return InfoItem(
                            icon:Transform(
                              transform: Matrix4.identity()..rotateZ(43),// 旋转的角度
                              origin: Offset(25,10),// 旋转的中心点
                              child:Icon(Icons.send,color: Colors.grey),
                            ),
                            titleText:Text(
                              FlutterI18n.translate(context, "homeOrgNotice",
                              Map.fromIterables(["org"], [info["org"]])),
                            ),
                            time:info["time"],
                            messageText:Text(info["message"]),
                          );
                        }).toList()
                      ),
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
        new Container(
          width: window.physicalSize.width*0.18,
          height: 110,
          decoration:new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          margin: EdgeInsets.fromLTRB(20, 130, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  FlutterI18n.translate(context, "homeDoingTask",
                  Map.fromIterables(["n"], ["5"])),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Center(
                heightFactor:2.0,
                child: Text(
                  FlutterI18n.translate(context, "homeDoneTask",
                  Map.fromIterables(["n"], ["3"])),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13
                  ),
                ),
              ),
            ],
          )
        ),
        new Container(
          width: 50,
          margin: EdgeInsets.fromLTRB(240, 100, 0, 20),
          height: 140,
            child: new Material(
            color: Colors.white,
            shape: new BeveledRectangleBorder(
              borderRadius:  BorderRadius.only(
                topRight:Radius.circular(100.0),
                topLeft:Radius.circular(30.0),
                // bottomRight: Radius.circular(10.0),
              ),
              side: new BorderSide(
                style: BorderStyle.none,
              )
            ),
          ),
        ),
        new Container(
          width: window.physicalSize.width*0.11,
          height: 140,
          decoration:new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10.0),
              topRight:Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          margin: EdgeInsets.fromLTRB(259, 100, 0, 20),
          child: Center(
            child: Container(
              width: 100,
              height: 80,
              color: Colors.grey[200],
              child: Center(
                child: Text('插图'),
              )
              
            ),
          ),
        ),
      ]
    );
  }
}
  