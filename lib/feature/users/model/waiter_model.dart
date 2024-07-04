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
    required this.id,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.image,
  });
  late final int id;
  late final String firstName;
  late final String email;
  late final String phone;
  late final String image;

  Waiters.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['image'] = image;
    return _data;
  }
}