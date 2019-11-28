import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:iwms_demo/locales/localizations.dart';
import 'dart:ui';
import 'main.dart';

class LoginPage extends StatefulWidget{
  final String title;
  

  const LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() =>_LoginPageState();
  
}
  
class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  var _isObscure = true;
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _uNameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  TabController _tabController;
  
  // //定义tab被选中和没被选中的颜色样式
  // Color _colorTabMatching({item}) {
  //   return _currenttab == item['value'] ? Color.fromRGBO(69,118,255, 1.0) : Colors.grey;
  // }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 2,);
  } 

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void sendMessage(){
    print("点我干什么");
  }

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
  buildAccountTextField(BuildContext context,String type) {
    return TextFormField(
      controller: _uNameController,
      autofocus:true,//自动获取焦点
      obscureText:false,
      validator: (String value) {
        if (value.isEmpty) {
          // return type=='account'?DemoLocalizations.of(context).text('inputAccount'):DemoLocalizations.of(context).text('inputPhone');
          return type=='account'?FlutterI18n.translate(context, "inputAccount"):FlutterI18n.translate(context, "inputPhone");
        }
      },
      cursorColor:Color.fromRGBO(56,157,153, 1.0),
      decoration: InputDecoration(
        // hintText:type=='account'?DemoLocalizations.of(context).text('inputAccount'):DemoLocalizations.of(context).text('inputPhone'),
        hintText:type=='account'?FlutterI18n.translate(context, "inputAccount"):FlutterI18n.translate(context, "inputPhone"),
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
          // return DemoLocalizations.of(context).text('inputAccountPwd');
          return FlutterI18n.translate(context, "inputAccountPwd");
        }
      },
      cursorColor:Color.fromRGBO(56,157,153, 1.0),

      decoration: InputDecoration(
          // hintText:DemoLocalizations.of(context).text('inputAccountPwd'),
          hintText:FlutterI18n.translate(context, "inputAccountPwd"),
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
   * 绘制动态验证码
   */
  buildMessagePwdTextField(BuildContext context){
    return TextFormField(
      controller: _pwdController,
      // onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          // return DemoLocalizations.of(context).text('inputMessagePwd');
          return FlutterI18n.translate(context, "inputMessagePwd");
        }
      },
      cursorColor:Color.fromRGBO(56,157,153, 1.0),

      decoration: InputDecoration(
          // hintText:DemoLocalizations.of(context).text('inputMessagePwd'),
          hintText:FlutterI18n.translate(context, "inputMessagePwd"),
          hintStyle:(
            TextStyle(
              color:Colors.grey,
            )
          ),
          fillColor:Colors.grey,
          // suffixText:'发送验证码'
          suffix:new Container(
            child: GestureDetector(
              child: Text(
                // DemoLocalizations.of(context).text('sendMessage'),
                FlutterI18n.translate(context, "sendMessage"),
                style: TextStyle(color: Colors.grey, fontSize: 18.0),
              ),
              onTap: this.sendMessage
                // TODO: 发送验证码 
            ),
          )
      ),
    );
  }
  /**
   * 绘制提交按钮
   */
  buildLoginButton(BuildContext context){
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 48.0,
        width: 403.0,
        child: FlatButton(
          child: Text(
            // DemoLocalizations.of(context).text('loginButtonText'),
            FlutterI18n.translate(context, "loginButtonText"),
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color:Color.fromRGBO(69, 118, 255, 1.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          // shape: StadiumBorder(),
          
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
      backgroundColor:Color.fromRGBO(69, 118, 255, 1.0),
      body: Form(
        key: _formKey,
        child:Column(
          children: <Widget>[
            new Center(
              child:new Container(
                width: 80.0,
                height: 75.0,
                margin: new EdgeInsets.only(top:60.0),
                decoration: new BoxDecoration(
                  image:new DecorationImage(
                    image: AssetImage('images/ic_iconlogo.png')
                  )
                ),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(top:0.0),
              child: new Text(
                'HDiWMS',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top:7.0),
              child: new Text(
                // DemoLocalizations.of(context).text('iwmsAppName'),
                FlutterI18n.translate(context, "iwmsAppName"),
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 12.0,
                  fontWeight:FontWeight.w100,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.only(
                  top: 25.0
                ),
                width: window.physicalSize.width,
                height: window.physicalSize.height*0.2549,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(25.0),
                    topLeft:Radius.circular(25.0),
                  ),
                ),
                child: new Container(
                  child: new ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(25),
                        topRight:Radius.circular(25),
                      ),
                      child:new Scaffold(
                        appBar: PreferredSize(
                          child: new AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0.5,
                            bottom: new TabBar(
                              labelColor:Color.fromRGBO(69, 118, 255, 1),
                              indicatorColor:Color.fromRGBO(69, 118, 255, 1),
                              // indicator: new BoxDecoration(
                              //   border: new Border(
                              //     bottom: BorderSide(
                              //       color: Color.fromRGBO(161, 161, 161, 0.32),
                              //       width: 0.5
                              //     )
                              //   ),
                          //   ),
                              controller: _tabController,
                              tabs: <Widget>[
                                // new Tab(text: DemoLocalizations.of(context).text('accountLogin')),
                                new Tab(text: FlutterI18n.translate(context, "accountLogin")),
                                // new Tab(text: DemoLocalizations.of(context).text('phoneLogin')),
                                new Tab(text: FlutterI18n.translate(context, "phoneLogin")),
                              ]
                            ),
                          ),
                          preferredSize: Size.fromHeight(48.0),
                        ),
                        body: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                new Container(
                                  color:Colors.white,
                                  padding: new EdgeInsets.all(36.0),
                                  child:buildAccountTextField(context,'account'),
                                ),
                                new Container(
                                  color:Colors.white,
                                  padding: new EdgeInsets.fromLTRB(36.0,16.0,36.0,0.0),
                                  child:buildPwdTextField(context),
                                ),
                                new Container(
                                  height: 300.0,
                                  padding: new EdgeInsets.fromLTRB(36.0,60.0,30.0,30.0),
                                  child:buildLoginButton(context),
                                ),
                              ],
                            ),
                            Wrap(
                              children: <Widget>[
                                new Container(
                                  color:Colors.white,
                                  padding: new EdgeInsets.all(36.0),
                                  child:buildAccountTextField(context,'phone'),
                                ),
                                new Container(
                                  color:Colors.white,
                                  padding: new EdgeInsets.fromLTRB(36.0,16.0,36.0,0.0),
                                  child:buildMessagePwdTextField(context),
                                ),
                                new Container(
                                  color:Colors.white,
                                  height: 300.0,
                                  padding: new EdgeInsets.fromLTRB(36.0,60.0,30.0,30.0),
                                  child:buildLoginButton(context),
                                ),
                              ],
                            )
                          ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            
          ],
        )
      ),
    );
    // return null;
  }

}