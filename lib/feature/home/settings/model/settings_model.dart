class SettingsModel {
  SettingsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final SettingsData data;

  SettingsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = SettingsData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class SettingsData {
  SettingsData({
    this.id,
    required this.deliveryPrice,
    required this.appName,
    required this.phone,
    required this.email,
    required this.taxNumber,
    this.logo,
    required this.address,
    required this.fax,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.tiktok,
    required this.google,
    required this.whatsapp,
    required this.drinkCatId,
    this.createdAt,
    this.updatedAt,
  });
  late final int? id;
  late final String deliveryPrice;
  late final String appName;
  late final String phone;
  late final String email;
  late final String taxNumber;
  late final String? logo;
  late final String address;
  late final String fax;
  late final String facebook;
  late final String twitter;
  late final String instagram;
  late final String tiktok;
  late final String google;
  late final String whatsapp;
  late final int drinkCatId;
  late final String? createdAt;
  late final String? updatedAt;

  SettingsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    deliveryPrice = json['delivery_price'];
    appName = json['app_name'];
    phone = json['phone'];
    email = json['email'];
    taxNumber = json['tax_number'];
    logo = json['logo'];
    address = json['address'];
    fax = json['fax'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    tiktok = json['tiktok'];
    google = json['google'];
    whatsapp = json['whatsapp'];
    drinkCatId = json['drink_cat_id'];
    createdAt = null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['delivery_price'] = deliveryPrice;
    _data['app_name'] = appName;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['tax_number'] = taxNumber;
    _data['logo'] = logo;
    _data['address'] = address;
    _data['fax'] = fax;
    _data['facebook'] = facebook;
    _data['twitter'] = twitter;
    _data['instagram'] = instagram;
    _data['tiktok'] = tiktok;
    _data['google'] = google;
    _data['whatsapp'] = whatsapp;
    _data['drink_cat_id'] = drinkCatId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class CreateSettingsModel {
  CreateSettingsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<dynamic> data;

  CreateSettingsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}