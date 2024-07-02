class CouponModel {
  CouponModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Coupon> data;

  CouponModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Coupon.fromJson(e)).toList();
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

class Coupon {
  Coupon({
    this.id,
    this.nameAr,
    this.nameEn,
    this.nameHe,
    this.code,
    this.userUseCount,
    this.couponUseCount,
    this.usedNumber,
    this.discountType,
    this.discount,
    this.minPrice,
    this.endDate,
    this.toUser,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? nameHe;
  late final String? code;
  late final userUseCount;
  late final couponUseCount;
  late final usedNumber;
  late final String? discountType;
  late final String? discount;
  late final String? minPrice;
  late final String? endDate;
  late final toUser;
  late final int? status;
  late final int? isDeleted;
  late final String? createdAt;
  late final String? updatedAt;

  Coupon.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameHe = json['name_he'];
    code = json['code'];
    userUseCount = null;
    couponUseCount = null;
    usedNumber = null;
    discountType = json['discount_type'];
    discount = json['discount'];
    minPrice = json['min_price'];
    endDate = json['end_date'];
    toUser = null;
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['name_he'] = nameHe;
    _data['code'] = code;
    _data['user_use_count'] = userUseCount;
    _data['coupon_use_count'] = couponUseCount;
    _data['used_number'] = usedNumber;
    _data['discount_type'] = discountType;
    _data['discount'] = discount;
    _data['min_price'] = minPrice;
    _data['end_date'] = endDate;
    _data['to_user'] = toUser;
    _data['status'] = status;
    _data['is_deleted'] = isDeleted;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}