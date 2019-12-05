import 'package:flutter/material.dart';

class LineItem extends StatefulWidget{
  final int index;
  final int totalLength;
  final Widget info;

  LineItem({this.info,this.index,this.totalLength});

   @override
  _LineItemState createState() =>_LineItemState();
  
}
class _LineItemState extends State<LineItem> {
  double item_height =0.0;
  GlobalKey textKey =new GlobalKey();

  @override
  void initState() {
    super.initState();
    ///  监听是否渲染完
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback){
    ///  获取相应控件的size
      RenderObject renderObject =textKey.currentContext.findRenderObject();
      setState(() {
        item_height = renderObject.semanticBounds.size.height;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // 左侧圆圈
          Container(
            margin:EdgeInsets.only(left:20),
            height:item_height+20,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:10,
                  width:10,
                  decoration:BoxDecoration(
                    color:Colors.grey,
                    borderRadius:BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                Expanded(
                  child:Container(
                    width:widget.index+1==widget.totalLength?0:0.9,
                    color:Colors.grey,
                  )
                ),
              ],
            ),
          ),

          // 右侧内容
          Container(
            child:Padding(
              key:textKey,
              padding:const EdgeInsets.only(left:20, top:0, bottom:20),
              child:widget.info
            ),
          ),

        ],
      ),
    );
  }
  
}