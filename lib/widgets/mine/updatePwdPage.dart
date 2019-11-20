import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwms_demo/widgets/myWidgets/input_text.dart';

class UpdatePwdPage extends StatefulWidget{
  @override
  _UpdatePwdPageState createState()=>_UpdatePwdPageState();
    
}
  
class _UpdatePwdPageState extends State<UpdatePwdPage>with AutomaticKeepAliveClientMixin{
  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => false;

  GlobalKey _formKey = new GlobalKey<FormState>();


  TextEditingController _oldPwdController = TextEditingController();
  TextEditingController _newPwdController = TextEditingController();
  TextEditingController _surePwdController = TextEditingController();

  // /**
  //  * 绘制文本输入框
  //  */
  // buildTextField (BuildContext context,TextEditingController controller,String name,GlobalKey key){
  //   return Row(
  //       children: <Widget>[
  //         Container(
  //           child: Text(name),
  //           padding: name!='确认密码'?const EdgeInsets.only(right:14.0):null,
  //         ),
  //         Expanded(
  //           child: Container(
  //             margin: EdgeInsets.only(left: 15),
  //             // decoration:BoxDecoration(
  //             //   border:Border(bottom: BorderSide(width: 0.8,color: Color(0xff2D4ED1))), //底部border
  //             // ),
  //             padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
  //             child: TextField(
  //               key: key,
  //               controller: controller,
  //               decoration: InputDecoration(
  //                 hintText: '请输入'+name,
  //                 fillColor:Colors.red,
  //                 contentPadding: EdgeInsets.fromLTRB(0, 17, 15, 15), //输入框内容部分设置padding，跳转跟icon的对其位置
  //                 border:InputBorder.none,
  //               ),
  //               obscureText: true, //是否是以星号*显示密码
  //             ),
  //           ),
  //         )
  //       ],
  //     );
  // }
  

  /**
   * 绘制提交按钮
   */

  buildSaveButton (BuildContext context){
    return Align(
      child: SizedBox(
        height: 40.0,
        width: 350.0,
        child: FlatButton(
          child: Text(
            '保存',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color:Color.fromRGBO(59,119,227, 1.0),
          // shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
          // shape: StadiumBorder(),
          
          onPressed: () {
            // TODO: 输入内容校验
            print(_oldPwdController.text);
            print((_formKey.currentState as FormState).validate());
            if ((_formKey.currentState as FormState).validate()) {
              // TODO:提交->调用保存方法
               
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('修改密码',style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body:Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom:20.0),
              color: Colors.white,
              child: new Padding(
                      padding: new EdgeInsets.only(left:30.0,right: 30.0),
                      // child:buildTextField(context,_oldPwdController,'原密码',oldpwdKey),
                      child: InputText(context:context,controller:_oldPwdController,name:'原密码'),
                    ),
            ),
            Container(
              color: Colors.white,
              child: new Padding(
                      padding: new EdgeInsets.only(left:30.0,right: 30.0),
                      child: InputText(context:context,controller:_newPwdController,name:'新密码'),
                    ),
            ),
            Container(
              color: Colors.white,
              child: new Padding(
                      padding: new EdgeInsets.only(left:30.0,right: 30.0),
                      child: InputText(context:context,controller:_surePwdController,name:'确认密码'),
                    ),
            ),
            Container(
              child: buildSaveButton(context),
              margin: const EdgeInsets.only(top:400.0),
            ),
          ],
        ),
      )
    );
  }
}