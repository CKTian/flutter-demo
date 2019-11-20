import 'dart:convert';

class Paging{
  int pageSize;
  int page;
  int pageCount;
  int  recordCount; 
  bool more;

  Paging.fromParams(this.pageSize, this.page, this.pageCount, this.recordCount, this.more);
  
  factory Paging(jsonStr)=>jsonStr == null? null :
  jsonStr is String ? new Paging.fromJson(json.decode(jsonStr)) : new Paging.fromJson(jsonStr);

	Paging.fromJson(jsonRes) {
    recordCount = jsonRes['recordCount'];
		more = jsonRes['more'];
		pageSize = jsonRes['pageSize'];
		page = jsonRes['page'];
		pageCount = jsonRes['pageCount'];

    @override
    String toString() {
      return '{"more": ${more != null?'${json.encode(more)}':'null'},'+
      '"pageCount":${pageCount!=null?'${json.encode(pageCount)}':'null'}'+
      '"recordCount":${recordCount!=null?'${json.encode(recordCount)}':'null'}'+
      '"page":${page!=null?'${json.encode(page)}':'null'}'+
      '"pageSize":${pageSize!=null?'${json.encode(pageSize)}':'null'}';
    }

  }
}