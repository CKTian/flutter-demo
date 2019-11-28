import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

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

String layoutName(LayoutType layoutType,BuildContext context){
  switch (layoutType) {
    case LayoutType.home:
      return FlutterI18n.translate(context, "homePage");
    case LayoutType.order:
      return FlutterI18n.translate(context, "functionPage");
    case LayoutType.task:
      return FlutterI18n.translate(context, "noticePage");
    case LayoutType.mine:
      return FlutterI18n.translate(context, "minePage");
    default:
      return '';
  }
}