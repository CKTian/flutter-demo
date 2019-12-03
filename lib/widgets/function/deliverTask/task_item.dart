import 'package:flutter/material.dart';
import 'package:iwms_demo/widgets/function/deliverTask/TaskState.dart';

class TaskItem extends StatelessWidget{
  VoidCallback onPressed;
  String billNumber;
  int childNum;
  String qtyStr;
  int weight;
  String time;
  TaskState billState;

  TaskItem({Key key, 
  // this.info,
  this.billNumber,
  this.childNum,
  this.qtyStr,
  this.weight,
  this.time,
  this.billState,
  this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child:Container(
        height: 80,
        margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              decoration: new BoxDecoration(
                color: Colors.grey[200],
              ),
            ),
            Container(
              height: 80,
              width: 320,
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: new BoxDecoration(
                border:Border(
                  bottom: BorderSide(width: 0.8,color: Colors.grey[200])
                ), //底部border
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 20,
                        margin: EdgeInsets.only(right:6),
                        child: Chip(
                          padding: EdgeInsets.fromLTRB(0,2, 0, 30),
                          label: Text(TaskStateName(billState,context)["caption"]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                          backgroundColor: TaskStateName(billState,context)["color"],
                        ),
                      ),
                      Container(
                        child: Text(billNumber,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:35),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('子任务数：'+childNum.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                          )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('件数：'+childNum.toString()+"，重量："+weight.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                          )
                        ),
                      ),
                    ],
                  )
                ],
              )
              
              //   children: <Widget>[
              //     Expanded(
              //       flex: 1,
              //       child: Chip(label: Text(billState)),
              //     ),
                  // Expanded(
                  //   flex: 4,
                  //   child: Text(billNumber),
                  // ),
                  // Expanded(
                  //   flex: 2,
                  //   child: Text(
                  //     time,
                  //     style: TextStyle(
                  //       color: Colors.grey
                  //     ),
                  //   ),
                  // ),
              //   ],
              // ),
            )
          ],
        )
      )
      
    );
  }
}