import 'dart:convert';

class Response {
  String timestamp;
  String status;
  String error;
  String message;
  String path;

  Response.fromParams(this.timestamp,this.status,this.error,this.message,this.path);

  factory Response(jsonStr)=>jsonStr == null? null :
  jsonStr is String ? new Response.fromJson(json.decode(jsonStr)) : new Response.fromJson(jsonStr);

	Response.fromJson(jsonRes) {
    // Map<String, Object> map = json.decode(jsonRes);

    print(jsonRes);

		// timestamp = jsonRes["timestamp"];
		// status = jsonRes['status'];
		// error = jsonRes['error'];
		// message = jsonRes['message'];
		// path = jsonRes['path'];
  }

  @override
    String toString() {
      return '{"timestamp": ${timestamp != null?'${json.encode(timestamp)}':'null'},'+
      '"status":${status!=null?'${json.encode(status)}':'null'}'+
      '"error":${error!=null?'${json.encode(error)}':'null'}'+
      '"message":${message!=null?'${json.encode(message)}':'null'}'+
      '"path":${path!=null?'${json.encode(path)}':'null'}';
    }
}