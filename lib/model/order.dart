import 'dart:convert';

class Order {
  
  UCN vendor;
  UCN wrh;
  UCN owner;

  String id;

  String billNumber;

  String sourceBillNumber;

  String sourceUuid;

  String type;

  String state;

  String sourceWay;

  String logisticMode;

  String expireDate;

  String createTime;

  String beginReceiveTime;

  String endReceiveTime;

  String bookTime;

  String companyUuid;

  String dcUuid;

  String bookedQtyStr ;

  String bookedArticleCount ;

  String note;

  String beginReceiveUploadTime;

  String endReceiveUploadTime;

  String totalVolume;

  String totalWeight;

  String totalQtyStr;

  String totalArticleCount;

  String totalAmount;

  String totalReceivedVolume;

  String totalReceivedWeight;

  String totalReceivedQtyStr;

  String totalReceivedArticleCount;

  String totalReceivedQty;

  String totalReceivedAmount;

 List<OrderBillItem> items;
  // List items;

  Order.fromParams(this.vendor, this.wrh, this.owner, this.id, this.billNumber, this.sourceBillNumber, this.sourceUuid, this.type, this.state, this.sourceWay, this.logisticMode, this.expireDate, this.createTime, this.beginReceiveTime, this.endReceiveTime, this.bookTime, this.companyUuid, this.dcUuid, this.bookedQtyStr, this.bookedArticleCount, this.note, this.beginReceiveUploadTime, this.endReceiveUploadTime, this.totalVolume, this.totalWeight, this.totalQtyStr, this.totalArticleCount, this.totalAmount, this.totalReceivedVolume, this.totalReceivedWeight, this.totalReceivedQtyStr, this.totalReceivedArticleCount, this.totalReceivedQty, this.totalReceivedAmount, this.items);
  
  factory Order(jsonStr)=>jsonStr == null? null :
  jsonStr is String ? new Order.fromJson(json.decode(jsonStr)) : new Order.fromJson(jsonStr);

	Order.fromJson(jsonRes) {
		id = jsonRes['id'];
		billNumber = jsonRes['billNumber'];
		sourceBillNumber = jsonRes['sourceBillNumber'];
		sourceUuid = jsonRes['sourceUuid'];
		type = jsonRes['type'];
		state = jsonRes['state'];
		sourceWay = jsonRes['sourceWay'];
		logisticMode = jsonRes['logisticMode'];
		expireDate = jsonRes['expireDate'];
		createTime = jsonRes['createTime'];
		// beginReceiveTime = jsonRes['id'];
		// id = jsonRes['id'];
		// id = jsonRes['id'];
		// id = jsonRes['id'];
		// id = jsonRes['id'];
		// id = jsonRes['id'];
		// id = jsonRes['id'];
    items = jsonRes['items'] == null ? null : [];

		for (var item in items == null ? [] : jsonRes['items']){
			items.add(item);
		}

    vendor = jsonRes['vendor'] == null ? null : new UCN.fromJson(jsonRes['vendor']);
    @override
    String toString() {
      return '{"vendor":$vendor,"billNumber": ${billNumber != null?'${json.encode(billNumber)}':'null'},'+
      '"createTime":${createTime!=null?'${json.encode(createTime)}':'null'}'+
      '"items":$items';
    }

  }
}

class UCN{
  String id;
  String code;
  String name;
  
  UCN.fromParams({this.id,this.code,this.name});

  UCN.fromJson(jsonRes){
    id = jsonRes['id'];
    code = jsonRes['code'];
    name = jsonRes['name'];
  }
  @override
  String toString() {
    return '{"id":${id != null?'${json.encode(id)}':'null'},"code":${code!=null?'${json.encode(code)}':'null'},"name":${name!=null?'${json.encode(name)}':'null'}}}';
  }
}

class OrderBillItem {
   String billNumber;

   int line;

   String sourceUuid;

   String companyUuid;

   String dcUuid;

   UCN article;

   String billUuid;

   String spec;

   String qpcStr;

   String munit;

   String price;

   String qty;

   String qtyStr;

   String amount;

   String receivedQty;

   String receivedQtyStr;

   String receivedAmount;

   String note;

   String shelfLifeType;

   String shelfLifeDays;

   String receiveControlDays;

   String plateAdvice;
  
   String volume;
  
   String weight;

   OrderBillItem.fromParams({this.billNumber,this.line,this.article});

   OrderBillItem.fromJson(jsonRes){
    billNumber = jsonRes['billNumber'];
    line = jsonRes['line'];

    article = jsonRes['article'] == null ? null : new UCN.fromJson(jsonRes['article']);

    @override
    String toString() {
    return '{'+
      '"billNumber":${billNumber!=null?'${json.encode(billNumber)}':'null'}}'+
      '"line":${line!=null?'${json.encode(line)}':'null'}'+
      '"article"+$article'
    +'}';
    }
   }
}
