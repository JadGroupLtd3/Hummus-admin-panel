class DealsModel {
  DealsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Deals> data;

  DealsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Deals.fromJson(e)).toList();
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

class Deals {
  Deals({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.userUseCount,
    required this.totalPrice,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String startDate;
  late final String endDate;
  late final int userUseCount;
  late final String totalPrice;
  late final int status;
  late final int isDeleted;
  late final String createdAt;
  late final String updatedAt;

  Deals.fromJson(Map<String, dynamic> json){
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    userUseCount = json['user_use_count'];
    totalPrice = json['total_price'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['user_use_count'] = userUseCount;
    _data['total_price'] = totalPrice;
    _data['status'] = status;
    _data['is_deleted'] = isDeleted;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}