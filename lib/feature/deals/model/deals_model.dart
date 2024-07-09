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

class CreateDealModel {
  CreateDealModel({
    this.id,
    required this.startDate,
    required this.endDate,
    required this.userUseCount,
    required this.totalPrice,
    required this.ar,
    required this.en,
    required this.he,
    required this.meals,
    required this.status,
  });
  late final id;
  late final String startDate;
  late final String endDate;
  late final userUseCount;
  late final totalPrice;
  late final TextType ar;
  late final TextType en;
  late final TextType he;
  late final List<DealMealsModel> meals;
  late final status;

  CreateDealModel.fromJson(Map<String, dynamic> json){
    startDate = json['start_date'];
    endDate = json['end_date'];
    userUseCount = json['user_use_count'];
    totalPrice = json['total_price'];
    ar = TextType.fromJson(json['ar']);
    en = TextType.fromJson(json['en']);
    he = TextType.fromJson(json['he']);
    meals = List.from(json['meals']).map((e)=>DealMealsModel.fromJson(e)).toList();
    status = json['status'];
  }

  Map<String, String> decodeMeals() {
    final Map<String, String> mealList = {};
    for (int i = 0; i < meals.length; i++) {
      mealList.addAll({
        'meals[$i][meal_id]': meals[i].mealId.toString(),
        'meals[$i][price]': meals[i].price.toString(),
      });
    }
    return mealList;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['user_use_count'] = userUseCount;
    _data['total_price'] = totalPrice;
    _data['ar'] = ar.toJson();
    _data['en'] = en.toJson();
    _data['he'] = he.toJson();
    _data['meals'] = meals.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    return _data;
  }
}

class TextType {
  TextType({
    required this.name,
    required this.description,
    required this.image,
  });
  late final String name;
  late final String description;
  late final String image;

  TextType.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['image'] = image;
    return _data;
  }
}

class DealMealsModel {
  DealMealsModel({
    required this.mealId,
    required this.price,
  });
  late final int mealId;
  int? price;

  DealMealsModel.fromJson(Map<String, dynamic> json){
    mealId = json['meal_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meal_id'] = mealId;
    _data['price'] = price;
    return _data;
  }
}