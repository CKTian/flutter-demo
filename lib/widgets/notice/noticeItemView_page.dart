import 'package:flutter/material.dart';

class NoticeItemView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('配送中心通知'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.8,color: Colors.grey[200]
                )
              )
            ),
            child: Column(
              children: <Widget>[
                Text('配送中心工作时间调整公告配送中心工作时间调整公告配送中心工作时间',),
                Text(''),
                Text('关于双十一期间工作时间调整如下：人75834UI认为会发生的粉红色空间的回复肌肤 i 上飞机哦 i 位哈佛ihi 哦我还否福建省地方就是来看好了口红柚子有蚊子文字去图片这里哦',
                  style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,left: 20),
            child: Text('共 2 条回复'),
          ),
          Container(
            height:MediaQuery.of(context).size.height*0.55,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.8,color: Colors.grey[200]
                )
              )
            ),
            child: new ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 20,top: 10),
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor:Colors.grey[350]
                              )
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin: EdgeInsets.only(left: 10,top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("王天博："),
                                  new Text("收到"),
                                ],
                              )
                            ),
                          ),
                          Expanded(
                            flex:3,
                            child: Container(
                            margin: EdgeInsets.only(left: 50,right: 10),
                            child: Text('今天 20:02',style: TextStyle(color: Colors.grey))
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
          Container(
            height: 30,
            margin: EdgeInsets.only(top: 10,right: 20,left: 20),
            child: new TextField(
              cursorWidth:1,
              cursorColor:Color.fromRGBO(69, 118, 255, 1.0),
              decoration: InputDecoration(
                hintText: '在这里说点什么吧',
                contentPadding:EdgeInsets.fromLTRB(10,0,0,20),
                fillColor:Colors.grey,
                focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.8, //边线宽度为2
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    width: 0.2, 
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}