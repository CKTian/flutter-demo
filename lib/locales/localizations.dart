import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'loginButtonText': 'Login',
      'changeLanguage': 'Change Language',
      'Chinese': 'Chinese',
      'English': 'English',
      'changeOrg': 'Change Org',
      'updatePassword': 'Update Password',
      'about': 'About',
      'logout': 'Logout',
      'baiduGPS': 'Baidu GPS',
    },
    'zh': {
      'loginButtonText': '登录',
      'changeLanguage': '切换语言',
      'English': '英语',
      'Chinese': '中文',
      'changeOrg': '切换组织',
      'updatePassword': '修改密码',
      'about': '关于',
      'logout': '退出当前账号',
      'baiduGPS': '百度鹰眼',
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