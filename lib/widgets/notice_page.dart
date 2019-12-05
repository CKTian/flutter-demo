import 'package:flutter/material.dart';

import 'notice/noticeItemView_page.dart';

class Noticepage extends StatefulWidget{
  @override
  _NoticepageState createState() =>_NoticepageState();
    
}
  
class _NoticepageState extends State<Noticepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){
          return Container(
            margin: EdgeInsets.only(top: 20),
            height: 156,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Transform(
                        transform: Matrix4.identity()..rotateZ(43),// 旋转的角度
                        origin: Offset(25,10),// 旋转的中心点
                        child:Icon(Icons.send,color: Colors.grey,size: 20,),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text('配送中心通知')
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('今天 15:01:05',style: TextStyle(color: Colors.grey),)
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, 
                      new MaterialPageRoute(builder: (context) => new NoticeItemView()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 5, 10, 5),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("配送中心工作时间调整公告配送中心工作时间作时间调整公告配送中心工作时间调整公告"),
                        Text('关于双十一期间工作时间调整如下：...',style: TextStyle(color: Colors.grey),)
                      ],
                    ) 
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 50,right: 10),
                        child: new CircleAvatar(
                          radius: 10.0,
                          backgroundColor:Colors.grey[350]
                        )
                      ),
                      new Text("王天博："),
                      new Text("收到"),
                      new GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(left:10),
                          child: Text('回复',style: TextStyle(color: Color.fromRGBO(69, 118, 255, 1.0)),),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 10,right: 10,left: 50),
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
        },
      ),
    );
  }

}