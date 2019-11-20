import 'package:flutter/material.dart';
import 'package:iwms_demo/model/response.dart';

import 'main.dart';
import 'service/login.dart';

class LoginPage extends StatefulWidget{
  final String title;

  const LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() =>_LoginPageState();
  
}
  
class _LoginPageState extends State<LoginPage>{
  var _isObscure = true;
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _uNameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  /**
   * 调用登陆方法--及成功后跳转
   */
  void accountLogin(username,password) async {
    // Future(() => (Login().accountLogin(username,password)))
    // .then((e) {
      // TODO: 记录登录信息
      //  跳转界面
      // 第一个参数是路由，参数predicate返回true，停止
        Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder<Null>(
          // 主要有两个属性：一个是“pageBuilder”，用来创建所要跳转到的页面，另一个是“transitionsBuilder”，也就是我们可以自定义的转场效果。 
          pageBuilder:(BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation){
            // BuildContext实际是Element  Animation动画库中的核心类
            // AnimatedBuilder是用于构建动画的widget
            return AnimatedBuilder(
              animation: animation,// 动画
              builder: (BuildContext context, Widget child){ // 每次动画改变值时调用
                return Opacity( // 设置透明度
                  opacity: animation.value,
                  child: new MainPage(title: '我也不知道这个标题用在哪'),

                );
              },
            );

          },
          transitionDuration:Duration(milliseconds: 300)

        ), (Route route) => route == null);
    // },onError:(e){
    //   // Response response = Response.fromJson(e.response);
    //   //TODO: 展示登录失败的信息
    // });
  }

 /**
  * 绘制用户名输入框
  */
  buildAccountTextField(BuildContext context) {
    return TextFormField(
      controller: _uNameController,
      autofocus:true,//自动获取焦点
      obscureText:false,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入账户';
        }
      },
      cursorColor:Color.fromRGBO(56,157,153, 1.0),
      decoration: InputDecoration(
        labelText: '账户',
        labelStyle:(
          TextStyle(
            color:Colors.grey,
          )
        ),
        hintText:'请输入用户名',
        hintStyle:(
          TextStyle(
            color:Colors.grey,
            )
        ),
        fillColor:Colors.grey,
        // focusedBorder:
      )
    );
  }

  /**
   * 绘制密码输入框
   */
  buildPwdTextField(BuildContext context){
    return TextFormField(
      controller: _pwdController,
      // onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      cursorColor:Color.fromRGBO(56,157,153, 1.0),

      decoration: InputDecoration(
          labelText: '密码',
          labelStyle:(
            TextStyle(
              color:Colors.grey,
            )
          ),
          hintText:'请输入密码',
          hintStyle:(
            TextStyle(
              color:Colors.grey,
            )
          ),
          fillColor:Colors.grey,
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                   !_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              }
          )
      ),
    );
  }
  /**
   * 绘制提交按钮
   */
  buildLoginButton(BuildContext context){
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: FlatButton(
          child: Text(
            '登录',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color:Color.fromRGBO(56,157,153, 1.0),
          // shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
          shape: StadiumBorder(),
          
          onPressed: () {
            // TODO: 输入内容校验

            if ((_formKey.currentState as FormState).validate()) {
              // print("用户名是：" +_uNameController.text +"密码是："+_pwdController.text);
            //   ///只有输入的内容符合要求通过才会到达此处
            //   _formKey.currentState.save();
            //   print('email:$_email , assword:$_password');
              // 提交
               accountLogin(_uNameController.text,_pwdController.text);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child:ListView(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(30.0),
              child: new Image.asset(
                'images/ic_logo.png',
                scale: 1.5,
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(left:30.0,right: 30.0),
              child:buildAccountTextField(context),
            ),
            new Padding(
              padding: new EdgeInsets.only(left:30.0,right: 30.0),
              child:buildPwdTextField(context),
            ),
            new Padding(
              padding: new EdgeInsets.only(left:30.0,right: 30.0,top:100.0),
              child:buildLoginButton(context),
            ),
          ],
        )

      ),
    );
    // return null;
  }

}