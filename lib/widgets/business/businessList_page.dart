import 'package:flutter/material.dart';
import 'package:flutter_badge/flutter_badge.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:iwms_demo/widgets/home/info_item.dart';

class BusinessListView extends StatefulWidget{
  @override
  _BusinessListViewState createState() =>_BusinessListViewState();
    
}
  
class _BusinessListViewState extends State<BusinessListView>with AutomaticKeepAliveClientMixin{
  
  final List businessInfoList =[
    {'vehicleName':'闽AV9P22','time':'今天 10:15:33','shipBillNumber':'FJHN1910130000002','isRead':false},
    {'vehicleName':'闽AV9P16','time':'今天 09:12:08','shipBillNumber':'FJHN1910130000001','isRead':false},
    {'vehicleName':'闽AV9P22','time':'昨天 18:18:53','shipBillNumber':'FJHN1910120000004','isRead':false},
    {'vehicleName':'闽AV9P22','time':'昨天 15:45:23','shipBillNumber':'FJHN1910120000003','isRead':false},
    {'vehicleName':'闽AV9P35','time':'昨天 09:55:39','shipBillNumber':'FJHN1910120000002','isRead':true},
    {'vehicleName':'闽AV9P22','time':'昨天 07:15:43','shipBillNumber':'FJHN1910120000001','isRead':true},
  ];

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text(FlutterI18n.translate(context, 'homeBusinessInfo')),
        centerTitle: true,
        actions: <Widget>[
          new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Text(
                FlutterI18n.translate(context, "cleanUnReadNotice"),
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              // onTap: this.rightClick, 清除未读
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.0,10,15,0),
        child: Column(
          children: businessInfoList.map((info){
            return InfoItem(
                icon: (info["isRead"]!=null&&info["isRead"])?Icon(Icons.chat,color: Colors.grey,size:22):
                Container(
                  margin: EdgeInsets.fromLTRB(15,0,50,0),
                  child: Badge(
                    child: Icon(Icons.chat,color: Colors.grey,size:22),
                    number: 0,
                    offsetY: -5,
                    offsetX:-25,
                  ),
                ),
                  
                titleText:Text(
                  FlutterI18n.translate(context, "homeVehicleBeginLoading",
                  Map.fromIterables(["vehicleName"], [info["vehicleName"]])),
                  style: TextStyle(
                    color: (info["isRead"]!=null&&info["isRead"])?Colors.grey:Colors.black
                  ),
                ),
                time:info["time"],
                messageText:Text(
                  FlutterI18n.translate(context, "homeToRead",
                  Map.fromIterables(["billNumber"], [info["shipBillNumber"]])),
                  style: TextStyle(
                    color: (info["isRead"]!=null&&info["isRead"])?Colors.grey:Colors.black
                  ),
                ),
              );
          }).toList()
        ),
      )
      
    );
  }

}