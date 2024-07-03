class DeliveryTimeModel {
  DeliveryTimeModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<DeliveryTime> data;

  DeliveryTimeModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>DeliveryTime.fromJson(e)).toList();
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

class DeliveryTime {
  DeliveryTime({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String day;
  late final String from;
  late final String to;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  DeliveryTime.fromJson(Map<String, dynamic> json){
    id = json['id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['day'] = day;
    _data['from'] = from;
    _data['to'] = to;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}