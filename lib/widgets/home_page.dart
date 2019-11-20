import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text('首页'),
    );
  }

}
  