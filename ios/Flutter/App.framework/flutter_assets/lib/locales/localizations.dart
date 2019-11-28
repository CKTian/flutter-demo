import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // 启动页
      'iwmsAppName': 'iwmsApp',

      'homePage': 'Home',
      'functionPage': 'Funtion',
      'noticePage': 'Notice',
      'minePage': 'Mine',

      // 我的
      'loginButtonText': 'Login',
      'changeLanguage': 'Change Language',
      'Chinese': 'Chinese',
      'English': 'English',
      'changeOrg': 'Change Org',
      'updatePassword': 'Update Password',
      'about': 'About',
      'logout': 'Logout',
      'baiduGPS': 'Baidu GPS',

      //登陆页
      'inputAccount':'Please input your account',
      'inputPhone':'Please input your phone',
      'inputAccountPwd':'Please input your account password',
      'inputMessagePwd':'Please input your message password',
      'sendMessage':'Send Meaasge',
      'accountLogin':'Account Login',
      'phoneLogin':'Phone Login',
    },
    'zh': {
      // 启动页-导航
      'iwmsAppName': '物流供应链协作手机端',

      'homePage': '首页',
      'functionPage': '功能',
      'noticePage': '通知',
      'minePage': '我的',

      // 我的
      'loginButtonText': '登录',
      'changeLanguage': '切换语言',
      'English': '英语',
      'Chinese': '中文',
      'changeOrg': '切换组织',
      'updatePassword': '修改密码',
      'about': '关于',
      'logout': '退出当前账号',
      'baiduGPS': '百度鹰眼',

      // 登陆页
      'inputAccount':'请输入登陆账户',
      'inputPhone':'请输入手机号码',
      'inputAccountPwd':'请输入登陆密码',
      'inputMessagePwd':'请输入短信验证码',
      'sendMessage':'发送验证码',
      'accountLogin':'账号登陆',
      'phoneLogin':'手机号登陆',
    }
  };

  String text(textKey) {
    return _localizedValues[locale.languageCode][textKey];
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  // 加载资源的方式。
  // 可以看到这个方法返回的类型是一个Future
  // 因为我们可以将多语言文本资源放到服务端或者本地文件里，
  // 因此加载多文本资源可能是耗时的，所以这里返回的类型是Future
  // 这里为了演示上的方便，将文本资源直接硬编码到代码里了。
  static Future<DemoLocalizations> load(Locale locale) async {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  static const _TranslationDelegate delegate = _TranslationDelegate();
}

class _TranslationDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const _TranslationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) => DemoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) => false;
}