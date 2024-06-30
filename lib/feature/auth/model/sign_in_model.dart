class SignInModel {
  SignInModel({
    required this.code,
    required this.status,
    required this.message,
    required this.userCrediental,
  });

  late final int code;
  late final bool status;
  late final String message;
  late final UserCrediental userCrediental;

  SignInModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    userCrediental = UserCrediental.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    data['data'] = userCrediental.toJson();
    return data;
  }
}

class UserCrediental {
  UserCrediental({
    required this.user,
    required this.token,
  });

  late final UserSignIn user;
  late final String token;

  UserCrediental.fromJson(Map<String, dynamic> json) {
    user = UserSignIn.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['token'] = token;
    return data;
  }
}

class UserSignIn {
  UserSignIn({
    this.id,
    this.firstName,
    this.lastName,
    required this.phone,
    this.image,
    required this.password,
    this.deviceToken,
    this.lang,
    this.birthday,
    this.type,
    this.status,
    this.otpCode,
  });

  late final int? id;
  late final String? firstName;
  late final String? lastName;
  late final String? phone;
  late final String? image;
  late final String? password;
  late final String? birthday;
  late final String? type;
  late final int? status;
  late final String? otpCode;
  late final String? deviceToken;
  late final String? lang;

  UserSignIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    image = json['image'];
    password = json['password'];
    birthday = json['birthday'];
    deviceToken = json['device_token'];
    lang = json['lang'];
    type = json['type'];
    status = json['status'];
    otpCode = json['otp_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['image'] = image;
    data['device_token'] = deviceToken;
    data['lang'] = lang;
    data['password'] = password;
    data['birthday'] = birthday;
    data['type'] = type;
    data['status'] = status;
    data['otp_code'] = otpCode;
    return data;
  }
}
