import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

// 枚举底部导航栏
enum LayoutType{
  home,
  order,
  task,
  mine,
}

String layoutName(LayoutType layoutType){
  switch (layoutType) {
    case LayoutType.home:
      return '首页';
    case LayoutType.order:
      return '订单';
    case LayoutType.task:
      return '任务列表';
    case LayoutType.mine:
      return '我的';
    default:
      return '';
  }
}