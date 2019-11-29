import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}
  
class _TaskPageState extends State<TaskPage>with AutomaticKeepAliveClientMixin{
  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true;
  //定义tab页基本数据结构
  final List tabs = [
    {'name':'待出车','value':'wait'},
    {'name':'配送中','value':'ing'},
    {'name':'已完成','value':'ed'},
  ];
  
  final String taskpic = 'images/ic_mendianguanli.png';

  final List tasklist = [
    {'storeName':'全家浦驰店','billNumber':'00011911140001'},
    {'storeName':'联华江文店','billNumber':'00011911140002'},
    {'storeName':'金桥国际店','billNumber':'00011911140003'},
    {'storeName':'罗森联航路店','billNumber':'00011911140004'},
    {'storeName':'喜士多恒南路店','billNumber':'00011911140005'},
    {'storeName':'全家江文路店','billNumber':'00011911140006'},
  ];

  String _currenttab = 'wait';    //定义默认打开的Tab页

  @override
  void initState() {
    
  }

  //定义tab被选中和没被选中的颜色样式
  Color _colorTabMatching({item}) {
    return _currenttab == item['value'] ? Color.fromRGBO(59,119,227, 1.0) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(// 实现自定义滚动效果
        slivers:<Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(15),
              height: 40.0,
              // padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child:TextField(
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.search),
                  hintText: '输入任务单号',
                  contentPadding: EdgeInsets.only(top: 20,left: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: tabs.map((item){
                  return GestureDetector(    //手势监听控件，用于监听各种手势
                    child: Container(
                      padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                      child: Text(item['name'],style: TextStyle(color: _colorTabMatching(item: item))), 
                    ),
                    onTap:(){
                      setState(() {
                        _currenttab = item['value'];
                      });
                    }  
                    //onSelectTab函数的使用非常巧妙，
                    //相当于定义了一个接口，可操控当前控件以外的数据
                  );
                }).toList()      
              ),
            )
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              tasklist.map((task) {
                return Card(
                  elevation: 0,
                    child:new Container(
                      child: Row(
                        children:[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(25),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:  new AssetImage(taskpic),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin:new EdgeInsets.fromLTRB(0.0,25.0,0.0,0.0),
                                    child:Text(task['storeName']),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: new EdgeInsets.fromLTRB(0.0,5.0,0.0,0.0),
                                    child:Text(task['billNumber']),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]
                      ),
                    ),
                );
              }).toList(),
            ),
          ),
        ]
      )
    );
  }
}
  