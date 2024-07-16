class PushNotificationCategoryModel {
  PushNotificationCategoryModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<PushNotificationCategory> data;

  PushNotificationCategoryModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>PushNotificationCategory.fromJson(e)).toList();
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

class PushNotificationCategory {
  PushNotificationCategory({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameHe,
    required this.image,
    required this.sort,
    required this.status,
    required this.isDeleted,
  });
  late final int id;
  late final String nameAr;
  late final String nameEn;
  late final String nameHe;
  late final String image;
  late final int sort;
  late final int status;
  late final int isDeleted;

  PushNotificationCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameHe = json['name_he'];
    image = json['image'];
    sort = json['sort'];
    status = json['status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['name_he'] = nameHe;
    _data['image'] = image;
    _data['sort'] = sort;
    _data['status'] = status;
    _data['is_deleted'] = isDeleted;
    return _data;
  }
}