import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwms_demo/model/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  VoidCallback onPressed;

  OrderItem({Key key, this.order,this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(
          left: 18.0,top: 10.0,right: 18.0,bottom: 10.0),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: Text(
                        order.billNumber,
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Text(
                      '供应商：['+order.vendor.code+']'+order.vendor.name,
                      style: new TextStyle(color: Colors.grey,fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            new Container(
              decoration: new BoxDecoration(
                color: new Color(0xFFF6F6F8),
                borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
              ),
              padding: const EdgeInsets.only(
                top: 3.0,bottom: 3.0,left: 8.0,right: 8.0
              ),
              margin: const EdgeInsets.only(top: 12.0),
              child: Text(
                '下单时间：'+order.createTime,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}