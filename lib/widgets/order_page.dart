
import 'package:flutter/material.dart';
import 'package:iwms_demo/model/order.dart';
import 'package:iwms_demo/model/paging.dart';
import 'package:iwms_demo/service/order_respository.dart';
import 'package:iwms_demo/widgets/order/order_item.dart';
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}
  
class _OrderPageState extends State<OrderPage>with AutomaticKeepAliveClientMixin{
  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true;

  // 初始化滚动监听器，加载更多使用
  ScrollController _controller = new ScrollController();

  List<Order> orderList = List<Order>();
  Paging paging;
  int recordCount;
  int page = 0;
  int pageSize = 10;
  var searchKeyValues={
    'companyUuid': '0000005',
    'dcUuid': '000000510000001'
  };

  String loadMoreText = "没有更多数据";

  TextStyle loadMoreTextStyle =
      new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);
  

  // 设置初始查询条件

  // 初始化状态
  @override
  void initState() {
    super.initState();

    queryOrder();

    //固定写法，初始化滚动监听器，加载更多使用
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;
      if (maxScroll == pixel && orderList.length < recordCount) {
        setState(() {
          loadMoreText = "正在加载中...";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF4483f6), fontSize: 14.0);
        });
        // 查询
        setState(() {
          page:page++;// 分页查询
        });
        queryOrder();
      } else {
        setState(() {
          loadMoreText = "没有更多数据";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
        });
      }
    });
  }

  // 分页查询
   Future  queryOrder() async {
    Future(() => (OrderRespository().queryOrder(page,pageSize,searchKeyValues)))
    .then((orderRespository) {
      orderList.addAll(orderRespository.orderList);
      setState(() {
        orderList = orderList;
        paging = orderRespository.paging;
        recordCount = orderRespository.paging.recordCount;
      });
    });
  }


  // // // 异步任务
  // Future<List<Order>> _fetchOrderList() async {
  //   //请求后台
  //   Response response;
  //   Dio dio = new Dio(); 
  //   dio.options.headers= httpHeaders;
  //   response =await dio.post('${Config.API_SERVER}/iwms-facility/facility/order/page',data:{'pageFilter':{
  //     'searchKeyValues':{
  //       'companyUuid': '0000005',
  //       'dcUuid': '000000510000004'
  //     }
  //   }});
    
  //   List<Order> orderList = List<Order>();

  //   // 请求成功
  //   if(response.statusCode == 200){
  //     for(dynamic data in response.data['data']['records']){
  //       Order orderData = Order.fromJson(data);
  //       orderList.add(orderData);
  //     }
  //   }

  //   // 返回
  //   return orderList; 
  // }

  // 绘制列表组件
  // Widget _createListView(BuildContext context, AsyncSnapshot snapshot){
  Widget _createListView(){
    // List<Order> orderList = snapshot.data;
    return new RefreshIndicator(
      color: const Color(0xFF4483f6),
      //下拉刷新
      child: ListView.builder(
        key: new PageStorageKey('order-list'),
        itemCount: orderList.length,
        itemBuilder: (BuildContext context,int index){
          return OrderItem(
            onPressed: (){
              // 点击后跳转
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context)=>OrderItemPage(),
                )
              );
            },
            order: orderList[index],
          );
        },
        controller: _controller,
      ),
      onRefresh: queryOrder,
    );
    // return ListView.builder(
    //   key: new PageStorageKey('order-list'),
    //   itemCount: orderList.length,
    //   itemBuilder: (BuildContext context,int index){
    //     return OrderItem(
    //       onPressed: (){
    //         // 点击后跳转
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             // builder: (context)=>OrderItemPage(),
    //           )
    //         );
    //       },
    //       order: orderList[index],
    //     );
    //   }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: _createListView(),

        // child: FutureBuilder(
        //   future: _fetchOrderList(),
        //   // future: queryOrder(),
        //   builder: (context,AsyncSnapshot snapshot){
        //     // 根据异步返回结果，展示对应的组件
        //     switch (snapshot.connectionState){
        //       case ConnectionState.none:
        //       case ConnectionState.waiting:
        //         return new CircularProgressIndicator();
        //       default:
        //         if(snapshot.hasError){
        //           print('${snapshot.error}');
        //           return new  Text('错误:${snapshot.error}');

        //         }
        //         else
        //           return _createListView(context,snapshot);// 请求成功
        //     }
        //   }
        // ),
      ),
    );
  }
}
  