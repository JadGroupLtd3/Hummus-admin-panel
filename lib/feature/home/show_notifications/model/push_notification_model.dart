class PushNotificationModel {
  PushNotificationModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<PushNotification> data;

  PushNotificationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List.from(json['data']).map((e) {
        try {
          return PushNotification.fromJson(e);
        } catch (error) {
          print('Error parsing PushNotification: $error');
          return null;
        }
      }).where((element) => element != null).toList().cast<PushNotification>();
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PushNotification {
  PushNotification({
    required this.titleAr,
    required this.titleEn,
    required this.titleHe,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.descriptionHe,
    required this.imageAr,
    required this.imageEn,
    required this.imageHe,
    required this.type,
    this.category,
    this.createdAt,
    this.updatedAt,
  });
  late final String titleAr;
  late final String titleEn;
  late final String titleHe;
  late final String descriptionAr;
  late final String descriptionEn;
  late final String descriptionHe;
  late final String imageAr;
  late final String imageEn;
  late final String imageHe;
  late final String type;
  late final Category? category;
  late final String? createdAt;
  late final String? updatedAt;

  PushNotification.fromJson(Map<String, dynamic> json) {
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    titleHe = json['title_he'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    descriptionHe = json['description_he'];
    imageAr = json['image_ar'];
    imageEn = json['image_en'];
    imageHe = json['image_he'];
    type = json['type'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title_ar'] = titleAr;
    _data['title_en'] = titleEn;
    _data['title_he'] = titleHe;
    _data['description_ar'] = descriptionAr;
    _data['description_en'] = descriptionEn;
    _data['description_he'] = descriptionHe;
    _data['image_ar'] = imageAr;
    _data['image_en'] = imageEn;
    _data['image_he'] = imageHe;
    _data['type'] = type;
    _data['category'] = category?.toJson();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameHe,
    required this.image,
    required this.sort,
    required this.status,
    required this.isDeleted,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? nameHe;
  late final String? image;
  late final int? sort;
  late final int? status;
  late final int? isDeleted;

  Category.fromJson(Map<String, dynamic> json) {
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
