import 'package:dio/dio.dart';
import 'package:iwms_demo/common/config/config.dart';
import 'package:iwms_demo/common/config/httpHeaders.dart';

class Login {
  String username;
  String password;
  
  Login({this.username,this.password});

  Response response;
  Dio dio = new Dio(); 

  // 登录
  Future<Response> accountLogin(username,password) async {
    dio.options.headers= httpHeaders;
    // response = await dio.post('${Config.API_SERVER}/iwms-account/account/login/accountlogin',queryParameters:{
    //   "loginAccount":username,13
    //   "password":password,
    //   "deviceType":'Android'
    // });
    response.statusCode =200;
      print(response);

    if(response.statusCode == 200){
      print('登录成功,此时应跳转至登录页');
      return response;
    }
  }
}