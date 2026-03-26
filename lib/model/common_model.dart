class CommonModel {
  dynamic contentEncoding;
  dynamic contentType;
  Data? data;
  int? jsonRequestBehavior;
  dynamic maxJsonLength;
  dynamic recursionLimit;

  CommonModel({
    this.contentEncoding,
    this.contentType,
    this.data,
    this.jsonRequestBehavior,
    this.maxJsonLength,
    this.recursionLimit,
  });

  CommonModel.fromJson(Map<String, dynamic> json) {
    contentEncoding = json['ContentEncoding'];
    contentType = json['ContentType'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    jsonRequestBehavior = json['JsonRequestBehavior'];
    maxJsonLength = json['MaxJsonLength'];
    recursionLimit = json['RecursionLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ContentEncoding'] = contentEncoding;
    data['ContentType'] = contentType;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['JsonRequestBehavior'] = jsonRequestBehavior;
    data['MaxJsonLength'] = maxJsonLength;
    data['RecursionLimit'] = recursionLimit;
    return data;
  }
}

class Data {
  String? success;
  String? successMsg;
  dynamic results;

  Data({this.success, this.successMsg, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    successMsg = json['SuccessMsg'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Success'] = success;
    data['SuccessMsg'] = successMsg;
    data['results'] = results;
    return data;
  }
}
