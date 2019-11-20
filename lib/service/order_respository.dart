import 'package:dio/dio.dart';
import 'package:iwms_demo/common/config/config.dart';
import 'package:iwms_demo/common/config/httpHeaders.dart';
import 'package:iwms_demo/model/order.dart';
import 'package:iwms_demo/model/paging.dart';

class OrderRespository {
  Order order;
  List<Order> orderList;
  Paging paging;

  Response response;
  Dio dio = new Dio(); 
  
  OrderRespository({this.order,this.orderList,this.paging});

  // 分页查询
  Future<OrderRespository> queryOrder(int page,int pageSize,var searchKeyValues) async {
    
    dio.options.headers= httpHeaders;
    List<Order> orderList = List<Order>();
    Paging paging;
    // response = await dio.post('${Config.API_SERVER}/iwms-facility/facility/order/page',
    //   data:{
    //     'page':page,
    //     'pageSize':pageSize,
    //     'searchKeyValues':searchKeyValues
    //   }
    // );

    // 请求成功
    if(response.statusCode == 200){
      paging = Paging.fromJson(response.data['data']['paging']);
      for(dynamic data in response.data['data']['records']){
        Order orderData = Order.fromJson(data);
        orderList.add(orderData);
      }
    }
    return OrderRespository(orderList:orderList,paging:paging);
  }
}