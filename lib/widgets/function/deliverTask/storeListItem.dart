import 'package:flutter/material.dart';

class StoreListItem extends StatelessWidget {

  List headList;
  List dataList;

  StoreListItem({this.headList,this.dataList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.8,color: Colors.grey[200])
            )
          ),
          child: Row(
            children:headList.map((info){
              return Expanded(
                flex: info["flex"],
                child: Text(info["text"],style: TextStyle(fontWeight: FontWeight.bold)),
              );
              }).toList()
          ),
        ),
        SizedBox(
          height: 500,
          child: new ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context,int index){
              List<Widget> columuList =[];
              dataList[index].forEach((key,value){
                columuList.add(
                  Expanded(
                    flex: headList[columuList.length]["flex"],
                    child: Text(value.toString(),textAlign: (headList[columuList.length]["columnCenter"] == true)?TextAlign.center:TextAlign.start),
                  )
                );
              });
              return Container(
                height: 40,
                padding: new EdgeInsets.fromLTRB(15, 5, 20, 0),
                color: index.isOdd==true?Colors.grey[100]:null,
                child:Row(
                  children: columuList
                )
              );
            }
          ),
        )
        
      ],
    );
  }
}