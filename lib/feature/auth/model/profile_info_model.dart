class ProfileInfoModel {
  ProfileInfoModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  late final int code;
  late final bool status;
  late final String message;
  late final UserInfo data;

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = UserInfo.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data.toJson();
    return data;
  }
}

class UserInfo {
  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.image,
    this.birthday,
    this.type,
    this.status,
  });

  late final id;
  late final String? firstName;
  late final String? lastName;
  late final String? phone;
  late final image;
  late final String? birthday;
  late final String? type;
  late final status;

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    image = json['image'];
    birthday = json['birthday'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['image'] = image;
    data['birthday'] = birthday;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class UserSingleton {
  // Make userInfo mutable
  UserInfo? userInfo;

  // Private constructor
  UserSingleton._privateConstructor();

  // Static instance of UserSingleton
  static final UserSingleton _instance = UserSingleton._privateConstructor();

  // Getter to retrieve the instance
  static UserSingleton get instance => _instance;
}

// Usage
// To update userInfo: 
