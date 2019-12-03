import 'package:flutter/material.dart';
// 枚举底部导航栏
enum TaskState{
  SHIPING,
  APPROVED,
  FINISHED,
  DELIVERING
}

Map TaskStateName(TaskState taskState,BuildContext context){
  switch (taskState) {
    case TaskState.SHIPING:
      return {
        "caption":"装车中",
        "color":Colors.orange[200]
      };
    case TaskState.APPROVED:
      return {
        "caption":"已批准",
        "color":Colors.green[200]
      };
    case TaskState.DELIVERING:
      return {
        "caption":"配送中",
        "color":Colors.blue[200]
      };
    case TaskState.FINISHED:
      return {
        "caption":"已完成",
        "color":Colors.grey[200]
      };
    default:
      return {};
  }
}