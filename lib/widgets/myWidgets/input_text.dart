import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final context;
  final controller;
  final name;

  InputText({this.context,this.controller,this.name});
  
  @override
  Widget build(BuildContext context) {
    // return Container(
      
    // );
    return Row(
        children: <Widget>[
          Container(
            child: Text(name),
            padding: name!='确认密码'?const EdgeInsets.only(right:14.0):null,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              // decoration:BoxDecoration(
              //   border:Border(bottom: BorderSide(width: 0.8,color: Color(0xff2D4ED1))), //底部border
              // ),
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: TextField(
                key: key,
                controller: controller,
                decoration: InputDecoration(
                  hintText: '请输入'+name,
                  fillColor:Colors.red,
                  contentPadding: EdgeInsets.fromLTRB(0, 17, 15, 15), //输入框内容部分设置padding，跳转跟icon的对其位置
                  border:InputBorder.none,
                ),
                obscureText: true, //是否是以星号*显示密码
              ),
            ),
          )
        ],
      );
  }
}