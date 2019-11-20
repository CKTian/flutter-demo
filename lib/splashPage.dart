import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwms_demo/loginPage.dart';
import 'package:iwms_demo/main.dart';

class SplashPage extends StatefulWidget{
  @override
  SplashPageState  createState()=>new SplashPageState ();
}

class SplashPageState  extends State<SplashPage>{
  // 创建一个定时器，用于设定时间后跳出
  Timer _t;

  // 初始化状态
  @override
  void initState() { 
    super.initState();
    // 定时器第一个参数是时长，第二个是到期后的callback
    _t = new Timer(const Duration(milliseconds: 1500), (){
      try {
        // 到期后，打开一个新的界面-并销毁当前页面
        // 第一个参数是路由，参数predicate返回true，停止
        Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder<Null>(
          // 主要有两个属性：一个是“pageBuilder”，用来创建所要跳转到的页面，另一个是“transitionsBuilder”，也就是我们可以自定义的转场效果。 
          pageBuilder:(BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation){
            // BuildContext实际是Element  Animation动画库中的核心类
            // AnimatedBuilder是用于构建动画的widget
            return AnimatedBuilder(
              animation: animation,// 动画
              builder: (BuildContext context, Widget child){ // 每次动画改变值时调用
                return Opacity( // 设置透明度
                  opacity: animation.value,
                  // child: new MainPage(title: '我也不知道这个标题用在哪'),
                  // TODO: 跳转到登录界面
                  child: new LoginPage(title: '我也不知道这个标题用在哪') ,

                );
              },
            );

          },
          transitionDuration:Duration(milliseconds: 300)

        ), (Route route) => route == null);

      } catch (e) {
      }
    }); 
  }

  // 销毁
  @override
  void dispose() {
    _t.cancel();// 清除定时器
    super.dispose();// 销毁界面
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color:Color.fromRGBO(56,157,153, 1.0),
      child: Container(
        alignment:Alignment(0, -0.3),
        // color:Color.fromRGBO(59,119,227, 1.0),
        // width:100,
        // height:100,
        child: new Text(
          'welcome 海鼎',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.bold
          ),

        ),
      ),
    );
  }
}

