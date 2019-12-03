import 'dart:ui';
import 'package:flutter/material.dart';

import 'function/deliverTask/deliverTask_page.dart';

class FunctionPage extends StatefulWidget {
  @override
  _FunctionPageState createState() => _FunctionPageState();
}
  
class _FunctionPageState extends State<FunctionPage> with AutomaticKeepAliveClientMixin{

  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        new Scaffold(
          backgroundColor:Colors.grey[100],
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(69, 118, 255, 1.0),
                  borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 160, 25, 0),
                height: MediaQuery.of(context).size.height*0.5,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.grey[200],//阴影颜色
                      blurRadius: 5.0,//阴影大小
                    ),
                  ]
                ),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(25,15,0,25),
                      child: Text('报表功能'),
                    ),
                    Wrap(
                      // spacing: 5, //主轴上子控件的间距
                      runSpacing: 25, //交叉轴上子控件之间的间距
                      children: 
                        List.generate(5, (index) {
                        // return Container(
                          return Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 30,right:30),
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                    // gradient: LinearGradient(colors: [
                                    //   Colors.orangeAccent,
                                    //   Colors.orange,
                                    //   Colors.deepOrange
                                    // ]),
                                  ),
                              ),
                              Container(
                                child: Text('报表${index+1}'),
                              ),
                            ],
                          );
                        //   margin: EdgeInsets.only(left: 5,right: 5),
                        //   width: 100,
                        //   height: 100,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey[300]
                        //     // gradient: LinearGradient(colors: [
                        //     //   Colors.orangeAccent,
                        //     //   Colors.orange,
                        //     //   Colors.deepOrange
                        //     // ]),
                        //   ),
                        // );
                      })
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 70, 25, 0),
          height: MediaQuery.of(context).size.height*0.24,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(25,15,0,25),
                child: Text('业务功能'),
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      width: 150,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Center(
                        child: Text('配送任务'),
                      ), 
                      decoration: new BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onTap:(){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new DeliverTaskPage()),
                      );
                    }
                  ),
                  
                  Container(
                    width: 150,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(14, 0, 25,0),
                    decoration: new BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text('线路监控'),
                    ), 
                  )
                ],
              )
            ],
          ),
        ),
      ]
    );
  }
}