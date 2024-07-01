class HashtagModel {
  HashtagModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Hashtag> data;

  HashtagModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Hashtag.fromJson(e)).toList();
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

class Hashtag {
  Hashtag({
    this.id,
    this.nameAr,
    this.nameEn,
    this.nameHe,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? nameHe;
  late final String? image;
  late final int? status;
  late final String? createdAt;
  late final String? updatedAt;

  Hashtag.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameHe = json['name_he'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['name_he'] = nameHe;
    _data['image'] = image;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}