import 'package:flutter/material.dart';
import 'package:iwms_demo/widgets/function/deliverTask/storeListItem.dart';

class StoreTaskView extends StatefulWidget{

  String storeName;
  StoreTaskView({this.storeName});


 @override
  _StoreTaskViewState createState() =>_StoreTaskViewState();

}
class _StoreTaskViewState extends State<StoreTaskView> with SingleTickerProviderStateMixin{

  List handoverInfoList = [
    {"line":1,"handoverType":"整箱","handoverItem":"整箱数","totalHandoverNum":3,"realHandoverNum":"--"},
    {"line":2,"handoverType":"容器","handoverItem":"[Z1]周转箱","totalHandoverNum":3,"realHandoverNum":"--"},
    {"line":3,"handoverType":"附件","handoverItem":"[DT]蛋托","totalHandoverNum":1,"realHandoverNum":"--"},
    {"line":4,"handoverType":"附件","handoverItem":"[JQ]价签","totalHandoverNum":2,"realHandoverNum":"--"},
  ];

  List containerInfoList = [
    {"line":1,"containerType":"[Z1]周转箱","returnType":"按数量","totalReturnNum":2,"realReturnNum":"--"},
    {"line":2,"containerType":"[P1]托盘","returnType":"按条码","totalReturnNum":1,"realReturnNum":"--"},
  ];

  List textTabs =['交接信息','容器回收','返配信息'];

  TabController _tabController;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text('送至：'+widget.storeName),
        centerTitle: false,
        elevation: 0,
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Material(
            color: Colors.grey[50],
            child:new TabBar(
              indicatorColor:Color.fromRGBO(69, 118, 255, 1),
              labelColor: Colors.black,
              controller: _tabController,
              tabs: textTabs.map((tab){
                return new Tab(text:tab);
              }).toList(),
            ),
          )
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: textTabs.map((info){
          Widget child;
          if(info == '交接信息'){
            child = StoreListItem(
              headList:[{"text":"行","flex":1,"columnCenter":false},{"text":"交接类型","flex":2,"columnCenter":false},{"text":"交接项","flex":3,"columnCenter":false},{"text":"应交接数","flex":2,"columnCenter":true},{"text":"实际交接数","flex":2,"columnCenter":true}],
              dataList:handoverInfoList
            );
          }else if(info == '容器回收'){
            child =  StoreListItem(
              headList:[{"text":"行","flex":1,"columnCenter":false},{"text":"容器类型","flex":3,"columnCenter":false},{"text":"回收类型","flex":3,"columnCenter":false},{"text":"应回收数","flex":2,"columnCenter":true},{"text":"实际回收数","flex":3,"columnCenter":true}],
              dataList:containerInfoList
            );
          }else{
            child = Center(
              child:Text('司机尚未与门店交接',textAlign: TextAlign.center,),
            );
          }
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: child,
            ),
          );
        }).toList(),
      )
    );
  }
  
}