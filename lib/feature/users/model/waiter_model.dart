class WaitersModel {
  WaitersModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Waiters> data;

  WaitersModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Waiters.fromJson(e)).toList();
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

class Waiters {
  Waiters({
    this.id,
    required this.firstName,
    required this.email,
    required this.phone,
    this.image,
    this.lastName,
    this.password,
    this.birthday,
    this.type,
  });
  late final int? id;
  late final String? firstName;
  late final String? email;
  late final String? phone;
  late final String? image;
  late final String? lastName;
  late final String? password;
  late final String? birthday;
  late final String? type;

  Waiters.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    lastName = json['last_name'];
    password = json['password'];
    birthday = json['birthday'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['image'] = image;
    _data['last_name'] = lastName;
    _data['password'] = password;
    return _data;
  }
}

class CreateWaiterModel {
  CreateWaiterModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final Data data;

  CreateWaiterModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data =  Data.fromJson(json['data']);
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

class Data {
  Data({
    required this.firstName,
    required this.lastName,
    this.birthday,
    required this.phone,
    required this.type,
    required this.id,
  });
  late final String? firstName;
  late final String? lastName;
  late final String? birthday;
  late final String? phone;
  late final String? type;
  late final int? id;

  Data.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthday = json['birthday'];
    phone = json['phone'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['birthday'] = birthday;
    _data['phone'] = phone;
    _data['type'] = type;
    _data['id'] = id;
    return _data;
  }
}

class DeleteWaiterModel {
  DeleteWaiterModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<dynamic> data;

  DeleteWaiterModel.fromJson(Map<String, dynamic> json){
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