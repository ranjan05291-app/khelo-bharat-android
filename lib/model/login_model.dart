class LoginModel {
  bool? status;
  bool? success;
  String? message;
  Data? data;

  LoginModel({this.status, this.success, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  Null? email;
  String? referralCode;
  Null? referredBy;
  Null? avatarUrl;
  int? walletBalance;
  int? playCoin;
  bool? isBlocked;
  String? createdAt;

  User({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.referralCode,
    this.referredBy,
    this.avatarUrl,
    this.walletBalance,
    this.playCoin,
    this.isBlocked,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    referralCode = json['referral_code'];
    referredBy = json['referred_by'];
    avatarUrl = json['avatar_url'];
    walletBalance = json['wallet_balance'];
    playCoin = json['play_coin'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['referral_code'] = this.referralCode;
    data['referred_by'] = this.referredBy;
    data['avatar_url'] = this.avatarUrl;
    data['wallet_balance'] = this.walletBalance;
    data['play_coin'] = this.playCoin;
    data['is_blocked'] = this.isBlocked;
    data['created_at'] = this.createdAt;
    return data;
  }
}
