class PushNotificationMealsModel {
  PushNotificationMealsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<PushNotificationMeals> data;

  PushNotificationMealsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>PushNotificationMeals.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PushNotificationMeals {
  PushNotificationMeals({
    required this.id,
    required this.categoryId,
    required this.fakePrice,
    required this.totalPrice,
    required this.image,
    required this.status,
    this.sort,
    required this.coinPoints,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int categoryId;
  late final String fakePrice;
  late final String totalPrice;
  late final String image;
  late final int status;
  late final Null sort;
  late final int coinPoints;
  late final int isDeleted;
  late final String createdAt;
  late final String updatedAt;

  PushNotificationMeals.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryId = json['category_id'];
    fakePrice = json['fake_price'];
    totalPrice = json['total_price'];
    image = json['image'];
    status = json['status'];
    sort = null;
    coinPoints = json['coin_points'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['fake_price'] = fakePrice;
    _data['total_price'] = totalPrice;
    _data['image'] = image;
    _data['status'] = status;
    _data['sort'] = sort;
    _data['coin_points'] = coinPoints;
    _data['is_deleted'] = isDeleted;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}