import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwms_demo/locales/localizations.dart';
import 'package:iwms_demo/loginPage.dart';
import 'package:iwms_demo/main.dart';
import 'package:iwms_demo/utils/sharedPreferenceUtil.dart';

import 'mine/contact_item.dart';
import 'mine/menu_item.dart';
import 'mine/updatePwdPage.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}
  
class _MinePageState extends State<MinePage>with AutomaticKeepAliveClientMixin{

  // 定义appBar的高度
  final double _appBarHeight = 180.0;

  // 定义网络图片
  final String _userHead = 'images/touxiang01.jpg';
      // 'https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg';

  // 定义第一个选中
  int _newValue = 1;
  
  String _newLanguageValue ;

  // 初始化状态
  @override
  void initState() { 
    super.initState();
    SharedPreferenceUtil.getString("language").then((String value){
      if(value =='en_US'){
      _newLanguageValue = 'en';
      }else if(value =='zh_Hans_US'){
        _newLanguageValue = 'zh';
      }
    });
  }

  //调用原生方法
  Future runiOSMethod() async {
    const platform = const MethodChannel('baidu');// 通道名
    var result;
    try {
      result = await platform.invokeMethod('gps');// 通道下的方法
      return Future.value(result);
    } on PlatformException catch (e) {
      return Future.error(e.toString());
    }
  }

  /**
   * 绘制选项卡
   */
  buildSimpleDialogOption (){
    // var roleList =['[0001]企业','[0002]配送中心','[0003]承运商','[0004]小门店'];
    var roleList =[{'no':1,'name':'[0001]企业'},{'no':2,'name':'[0002]配送中心'},{'no':3,'name':'[0003]承运商'},{'no':4,'name':'[0004]小门店'}];
    // new SimpleDialogOption(
    //     child: new Text('选项 1'),
    //     onPressed: () {
    //         Navigator.of(context).pop();
    //     },
    // ),
    List<Widget> options = [];
    roleList.forEach((role)=>
      options.add(
        RadioListTile(
          value: role['no'],
          //当前Radio 所在组的值
          //只有value 与groupValue 值一至时才会被选中
          groupValue: _newValue,
          title: new Text(role['name']),
          onChanged: (value) {
            // TODO: 切换
            setState(() {
              _newValue = value;
            });
            Navigator.of(context).pop();
          })
        )
    );    
    return options;
  }

  @override
  // 面切换后保持原页面状态
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(// 实现自定义滚动效果
        slivers:<Widget>[
          new SliverAppBar( // 实现头部展开、合并的效果
            expandedHeight: _appBarHeight,// 折叠高度
            flexibleSpace:new FlexibleSpaceBar( // 可以理解为SliverAppBar的背景内容区
              collapseMode: CollapseMode.parallax, // 已视差的方式滚动
              background: new Stack( // 层叠布局
                fit: StackFit.expand,
                children: <Widget>[
                  // 装饰类
                  const DecoratedBox(
                    // 装饰器 背景、边框、渐变等
                    decoration: const BoxDecoration(
                      // 过渡效果
                      gradient:const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),

                  // row布局
                  new Row(
                    // 主轴方向上的对齐方式，会对child的位置起作用，默认是start
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // 此组件会填满Row在主轴方向的剩余空间，撑开Row

                      // 左侧名称
                      new Expanded(
                        flex: 3,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,// 主轴
                          crossAxisAlignment: CrossAxisAlignment.start,// 交叉轴
                          children: [
                            new Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 30.0,
                                bottom: 15.0,
                              ),
                              child: new Text(
                                '王静香',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0
                                ),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: new Text(
                                '假程序员',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            )
                          ],
                        )
                      ),
                      
                      // 右侧头像
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            right: 30.0,
                          ),
                          child: new CircleAvatar(
                            radius: 35.0,
                            // backgroundImage: new NetworkImage(_userHead),
                            backgroundImage:  new AssetImage(_userHead),
                          ),
                        )
                      )
                    ],
                  )
                ],

              ),
            )
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new ContactItem(
                          count: '10',
                          title: '通知',
                        ),
                        new ContactItem(
                          count: '1000',
                          title: '员工',
                        ),
                        new ContactItem(
                          count: '155',
                          title: '回复',
                        ),
                        new ContactItem(
                          count: '1',
                          title: '待办任务',
                        ),
                      ]
                    )
                  ),
                ),
                new Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.room,
                        title: DemoLocalizations.of(context).text('baiduGPS'),
                        onPressed: (){
                            //TODO: 调用ios原生
                          runiOSMethod();
                        }
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: DemoLocalizations.of(context).text('changeLanguage'),
                        onPressed: (){
                          showDialog<Null>(
                            context: context,
                            builder: (BuildContext context) {
                                return new SimpleDialog(
                                    title: new Text(DemoLocalizations.of(context).text('changeLanguage')),
                                    children: [
                                      RadioListTile(
                                        value:'zh',
                                        groupValue: _newLanguageValue,
                                        title: new Text(DemoLocalizations.of(context).text('Chinese')),
                                        onChanged: (value) {
                                          setState(() {
                                            _newLanguageValue = value;
                                          });
                                          AppState.setting.changeLocale(Locale('zh','CH'));
                                          Navigator.of(context).pop();
                                        }
                                      ),
                                      RadioListTile(
                                        value:'en',
                                        groupValue: _newLanguageValue,
                                        title: new Text(DemoLocalizations.of(context).text('English')),
                                        onChanged: (value) {
                                          setState(() {
                                            _newLanguageValue = value;
                                          });
                                          AppState.setting.changeLocale(Locale('en','EN'));
                                          Navigator.of(context).pop();
                                        }
                                      )
                                    ],
                                );
                            },
                          ).then((val) {
                              // print(val);
                          });
                        },
                      ),
                      new MenuItem(
                        icon: Icons.archive,
                        title: DemoLocalizations.of(context).text('changeOrg'),
                        onPressed: (){
                          showDialog<Null>(
                            context: context,
                            builder: (BuildContext context) {
                                return new SimpleDialog(
                                    title: new Text(DemoLocalizations.of(context).text('changeOrg')),
                                    children: buildSimpleDialogOption()
                                        // new SimpleDialogOption(
                                        //     child: new Text('选项 1'),
                                        //     onPressed: () {
                                        //         Navigator.of(context).pop();
                                        //     },
                                        // ),
                                        // new SimpleDialogOption(
                                        //     child: new Text('选项 2'),
                                        //     onPressed: () {
                                        //         Navigator.of(context).pop();
                                        //     },
                                        // ),
                                    ,
                                );
                            },
                          ).then((val) {
                              print(val);
                          });
                        },
                      ),
                      new MenuItem(
                        icon: Icons.create,
                        title: DemoLocalizations.of(context).text('updatePassword'),
                        onPressed:(){
                          // 点击后跳转
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>UpdatePwdPage(),
                            )
                          );
                        }
                      ),
                      new MenuItem(
                        icon: Icons.error_outline,
                        title: DemoLocalizations.of(context).text('about'),
                      ),
                    ]
                  )
                ),
                new Container(
                  margin: const EdgeInsets.only(top:100.0),
                  child: Column(
                    children: <Widget>[
                      new MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        child: new Text(DemoLocalizations.of(context).text('logout')),
                        onPressed: () {
                          // TODO: 退出登录
                          // 跳转至登录界面
                          Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder<Null>(
                            pageBuilder:(BuildContext context, Animation<double> animation,
                                  Animation<double> secondaryAnimation){
                              return AnimatedBuilder(
                                animation: animation,// 动画
                                builder: (BuildContext context, Widget child){ // 每次动画改变值时调用
                                  return Opacity( // 设置透明度
                                    opacity: animation.value,
                                    child: new LoginPage(title: '我也不知道这个标题用在哪') ,

                                  );
                                },
                              );

                            },
                            transitionDuration:Duration(milliseconds: 300)

                          ), (Route route) => route == null);
                        },
                      )
                    ]
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
  