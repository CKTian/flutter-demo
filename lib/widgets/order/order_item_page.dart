import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iwms_demo/common/config/config.dart';
import 'package:iwms_demo/common/config/httpHeaders.dart';
import 'package:iwms_demo/model/order.dart';
import 'package:iwms_demo/widgets/order/order_item.dart';

class OrderItemPage extends StatefulWidget {
  final Order order;

  OrderItemPage({Key key,@required this.order}) : super(key: key);

  @override
  _OrderItemPageState createState() => _OrderItemPageState();
}

//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
class _OrderItemPageState extends State<OrderItemPage> with SingleTickerProviderStateMixin{
  // 滚动监听
  ScrollController _scrollController;

  // 异步方法
  Future<OrderItem> _fetchOrder() async {
    Dio dio = new Dio(); 
    dio.options.headers= httpHeaders;
    Response response = await dio.get('${Config.API_SERVER}/iwms-facility/facility/order/123');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: child,
    );
  }
}