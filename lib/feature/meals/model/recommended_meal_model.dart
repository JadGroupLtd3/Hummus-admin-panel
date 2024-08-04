class RecommendedMealModel {
  RecommendedMealModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final RecommendedMeal data;

  RecommendedMealModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = RecommendedMeal.fromJson(json['data']);
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

class RecommendedMeal {
  RecommendedMeal({
    required this.mealId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final mealId;
  late final status;
  late final updatedAt;
  late final createdAt;
  late final id;

  RecommendedMeal.fromJson(Map<String, dynamic> json){
    mealId = json['meal_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meal_id'] = mealId;
    _data['status'] = status;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}