import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iwms_demo/utils/sharedPreferenceUtil.dart';
import 'package:iwms_demo/locales/localizations.dart';
import 'package:iwms_demo/widgets/task_page.dart';
import 'package:iwms_demo/widgets/home_page.dart';
import 'package:iwms_demo/widgets/mine_page.dart';
import 'package:iwms_demo/widgets/order_page.dart';
import 'layout_Type.dart';
import 'splashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class _AppSetting {
  _AppSetting();
  
  Null Function(Locale locale) changeLocale;
  Locale _locale;
  List<Locale> _supportedLocales = [Locale('zh', 'CH'), Locale('en', 'US')];
}

class AppState extends State<MyApp> {

  Locale _locale;
  List<Locale> supportedLocales = [Locale('zh', 'CH'), Locale('en', 'US')];
  // 供外部使用的_AppSetting实例，用于修改app的状态
  static _AppSetting setting = _AppSetting();

  @override
  void initState() {
    super.initState();
    setting.changeLocale = (Locale locale) {
      if (setting._supportedLocales
          .map((locale) {
            return locale.languageCode;
          })
          .toSet()
          .contains(locale?.languageCode)) {
        setState(() {
          setting._locale = locale;
        });
      }
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: setting._locale,
      theme: ThemeData(
        primaryColor:Color.fromRGBO(59,119,227, 1.0),
      ),
      home: SplashPage(),
      localizationsDelegates: [                             //此处
        DemoLocalizations.delegate, // 这里加上这个,是自定义的delegate
        DefaultCupertinoLocalizations.delegate, // 这个截止目前只包含英文
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate, 
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        SharedPreferenceUtil.setString("language", '$deviceLocale');
      },
    supportedLocales: setting._supportedLocales,
  );
  }
}

// 第一个主页面
class MainPage extends StatefulWidget{
  final String title;

  // 将参数使用{}包裹，这样构造的时候可以选择性的传递，也可以完全不传
  MainPage({ Key key, this.title}):super(key:key);// TODO: super的意义
  
  @override
  _MainPageState createState() =>new _MainPageState();

}
// 第一个主页面的状态 
class _MainPageState extends State<MainPage>{
  // 默认选中底部导航的 order
  LayoutType _layoutSelection = LayoutType.home;

  //设置导航内容颜色--选中or未选中
  Color _colorTabMatching({LayoutType layoutSelection}){
    return _layoutSelection ==layoutSelection? Color.fromRGBO(59,119,227, 1.0) : Colors.grey;
  }

  //绘制底部导航-个体
  BottomNavigationBarItem _buildItem({String icon, LayoutType layoutSelection}){
    String text = layoutName(layoutSelection);
    
    return BottomNavigationBarItem(
      icon:new Image.asset(
        icon,
        width: 35.0,
        height: 35.0,
      ),
      title: Text(
        text,
        style:TextStyle(
          color:_colorTabMatching(layoutSelection: layoutSelection)
        )
      )
    );
  }

  // 选中一个导航
  _onLayoutSelected(LayoutType selection){
    setState(() {
     _layoutSelection = selection; 
    });
  }

  // 切换底部导航栏调用的方法
  void _onSelectTab(int index) {
    
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.home);
        break;
      case 1:
        _onLayoutSelected(LayoutType.order);
        break;
      case 2:
        _onLayoutSelected(LayoutType.task);
        break;
      case 3:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  // 展示头部导航栏
  Widget _buildAppBar(){
    if(_layoutSelection==LayoutType.mine){
      return null;
    }
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: new Text(layoutName(_layoutSelection),style: new TextStyle(fontSize: 20.0, color: Colors.white)),
    );
  }

  // 展示对应主体界面
  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.home:
        return HomePage();
      case LayoutType.order:
        return OrderPage();
      case LayoutType.task:
        return TaskPage();
      case LayoutType.mine:
        return MinePage();
    }
  }

  // 绘制底部导航条
  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type:BottomNavigationBarType.fixed,// 超过4个是fixed shifting
      onTap: _onSelectTab,// 选中变化回调函数
      items:[ // 底部按钮集合
        _buildItem(
          icon: _layoutSelection == LayoutType.home?'images/ic_home.png': 'images/ic_home_uncheck.png',
          layoutSelection:LayoutType.home
        ),
        _buildItem(
          icon: _layoutSelection == LayoutType.order?"images/ic_peisong.png": "images/ic_peisong_uncheck.png",
          layoutSelection:LayoutType.order
        ),
        _buildItem(
          icon: _layoutSelection == LayoutType.task?"images/ic_dashuju.png": "images/ic_dashuju_uncheck.png",
          layoutSelection:LayoutType.task
        ),
        _buildItem(
          icon: _layoutSelection == LayoutType.mine?"images/ic_geren.png": "images/ic_geren_uncheck.png",
          layoutSelection:LayoutType.mine
        ),
      ]
    );
  }

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:_buildAppBar(),// 顶部导航栏
      body: _buildBody(),// 主体
      bottomNavigationBar: _buildButtonNavBar(),// 底部
    );
  }

}