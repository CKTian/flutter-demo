import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:iwms_demo/widgets/function/deliverTask/TaskState.dart';
import 'package:iwms_demo/widgets/function/deliverTask/taskItemView_page.dart';
import 'package:iwms_demo/widgets/function/deliverTask/task_item.dart';

class DeliverTaskPage extends StatefulWidget{
  @override
  _DeliverTaskPageState createState() =>_DeliverTaskPageState();
    
}
  
  class _DeliverTaskPageState extends State<DeliverTaskPage> with SingleTickerProviderStateMixin{
    
    TabController _tabController;

    List todoList = [
      {"billNumber":"FJHN191030000001","childNum":2,"qtyStr":"3","weight":10000,"time":"今天 08:15:22","state":"TODO","billState":TaskState.SHIPING},
      {"billNumber":"FJHN191030000002","childNum":4,"qtyStr":"23","weight":10000,"time":"今天 09:52:12","state":"TODO","billState":TaskState.SHIPING},
      {"billNumber":"FJHN191030000003","childNum":3,"qtyStr":"4","weight":10000,"time":"今天 18:19:42","state":"TODO","billState":TaskState.APPROVED},
      {"billNumber":"FJHN191030000004","childNum":6,"qtyStr":"8","weight":10000,"time":"今天 18:52:32","state":"TODO","billState":TaskState.APPROVED},

    ];

    List doingList = [
      {"billNumber":"FJHN191030000005","childNum":1,"qtyStr":"98","weight":10000,"time":"今天 08:52:32","state":"DOING","billState":TaskState.DELIVERING},
      {"billNumber":"FJHN191030000006","childNum":2,"qtyStr":"16","weight":10000,"time":"今天 15:52:32","state":"DOING","billState":TaskState.DELIVERING},
    ];

    List doneList = [
      {"billNumber":"FJHN191030000007","childNum":4,"qtyStr":"100","weight":10000,"time":"今天 14:52:32","state":"DONE","billState":TaskState.FINISHED},
    ];

    @override
    void initState() {
      super.initState();
      _tabController = TabController(vsync: this,length: 3);
    } 

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context){
      return new Scaffold(
        appBar:AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          title: Text(FlutterI18n.translate(context, 'deliverTaskTitle')),
          centerTitle: true,
          actions: <Widget>[
            new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Icon(Icons.search)
                // onTap: this.rightClick, 查询
              ),
            )
          ],
          bottom: new TabBar(
            indicatorColor:Color.fromRGBO(69, 118, 255, 1),
            controller: _tabController,
            tabs: <Widget>[
              new Tab(text: '待出车'),
              new Tab(text: '配送中'),
              new Tab(text: '已完成'),
            ]
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child:  new ListView.builder(
                padding: new EdgeInsets.all(5.0),
                itemCount: todoList.length,
                itemBuilder: (BuildContext context,int index){
                  return TaskItem(
                    billNumber: todoList[index]["billNumber"],
                    billState: todoList[index]["billState"],
                    time: todoList[index]["time"],
                    qtyStr: todoList[index]["qtyStr"],
                    weight: todoList[index]["weight"],
                    childNum: todoList[index]["childNum"],
                  );
                },
              ),
            ),
            Container(
              child:  new ListView.builder(
                padding: new EdgeInsets.all(5.0),
                itemCount: doingList.length,
                itemBuilder: (BuildContext context,int index){
                  return TaskItem(
                    billNumber: doingList[index]["billNumber"],
                    billState: doingList[index]["billState"],
                    time: doingList[index]["time"],
                    qtyStr: doingList[index]["qtyStr"],
                    weight: doingList[index]["weight"],
                    childNum: doingList[index]["childNum"],
                  );
                },
              ),
            ),
            Container(
              child:  new ListView.builder(
                padding: new EdgeInsets.all(5.0),
                itemCount: doneList.length,
                itemBuilder: (BuildContext context,int index){
                  return TaskItem(
                    billNumber: doneList[index]["billNumber"],
                    billState: doneList[index]["billState"],
                    time: doneList[index]["time"],
                    qtyStr: doneList[index]["qtyStr"],
                    weight: doneList[index]["weight"],
                    childNum: doneList[index]["childNum"],
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>new TaskItemView(
                            paramsNumber:doneList[index]["billNumber"]
                          ),
                        )
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

class TaskItemViewPage {
}