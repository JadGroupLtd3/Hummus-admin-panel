class MealsModel {
  MealsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Meals> data;

  MealsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Meals.fromJson(e)).toList();
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

class Meals {
  Meals({
    required this.id,
    required this.name,
    required this.description,
    required this.fakePrice,
    required this.totalPrice,
    required this.primaryImage,
    required this.subImages,
    required this.coinPoints,
    required this.category,
    required this.hashtags,
    required this.components,
    required this.attributes,
    required this.homeCategoriesMeals,
    required this.relatedProducts,
  });
  late final int id;
  late final Name name;
  late final Description description;
  late final String fakePrice;
  late final String totalPrice;
  late final String primaryImage;
  late final List<dynamic> subImages;
  late final int coinPoints;
  late final Category category;
  late final List<Hashtags> hashtags;
  late final List<Components> components;
  late final List<Attributes> attributes;
  late final List<String> homeCategoriesMeals;
  late final relatedProducts;

  Meals.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = Name.fromJson(json['name']);
    description = Description.fromJson(json['description']);
    fakePrice = json['fake_price'];
    totalPrice = json['total_price'];
    primaryImage = json['primary_image'];
    subImages = List.castFrom<dynamic, dynamic>(json['sub_images']);
    coinPoints = json['coin_points'];
    category = Category.fromJson(json['category']);
    hashtags = List.from(json['hashtags']).map((e)=>Hashtags.fromJson(e)).toList();
    components = List.from(json['components']).map((e)=>Components.fromJson(e)).toList();
    attributes = List.from(json['attributes']).map((e)=>Attributes.fromJson(e)).toList();
    homeCategoriesMeals = List.castFrom<dynamic, String>(json['home_categories_meals']);
    relatedProducts = List.castFrom<dynamic, dynamic>(json['related_products']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name.toJson();
    _data['description'] = description.toJson();
    _data['fake_price'] = fakePrice;
    _data['total_price'] = totalPrice;
    _data['primary_image'] = primaryImage;
    _data['sub_images'] = subImages;
    _data['coin_points'] = coinPoints;
    _data['category'] = category.toJson();
    _data['hashtags'] = hashtags.map((e)=>e.toJson()).toList();
    _data['components'] = components.map((e)=>e.toJson()).toList();
    _data['attributes'] = attributes.map((e)=>e.toJson()).toList();
    _data['home_categories_meals'] = homeCategoriesMeals;
    _data['related_products'] = relatedProducts;
    return _data;
  }
}

class Name {
  Name({
    required this.ar,
    required this.en,
    required this.he,
  });
  late final String ar;
  late final String en;
  late final String he;

  Name.fromJson(Map<String, dynamic> json){
    ar = json['ar'];
    en = json['en'];
    he = json['he'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    _data['he'] = he;
    return _data;
  }
}

class Description {
  Description({
    required this.ar,
    required this.en,
    required this.he,
  });
  late final String ar;
  late final String en;
  late final String he;

  Description.fromJson(Map<String, dynamic> json){
    ar = json['ar'];
    en = json['en'];
    he = json['he'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    _data['he'] = he;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.sort,
  });
  late final int id;
  late final Name name;
  late final int sort;

  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = Name.fromJson(json['name']);
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name.toJson();
    _data['sort'] = sort;
    return _data;
  }
}

class Hashtags {
  Hashtags({
    required this.id,
    required this.name,
    required this.image,
  });
  late final int id;
  late final Name name;
  late final String image;

  Hashtags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = Name.fromJson(json['name']);
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name.toJson();
    _data['image'] = image;
    return _data;
  }
}

class Components {
  Components({
    required this.id,
    required this.componentId,
    required this.name,
    required this.isDefault,
    this.price,
    required this.image,
  });
  late final int id;
  late final int componentId;
  late final Name name;
  late final int isDefault;
  late final price;
  late final String image;

  Components.fromJson(Map<String, dynamic> json){
    id = json['id'];
    componentId = json['component_id'];
    name = Name.fromJson(json['name']);
    isDefault = json['is_default'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['component_id'] = componentId;
    _data['name'] = name.toJson();
    _data['is_default'] = isDefault;
    _data['price'] = price;
    _data['image'] = image;
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.label,
    required this.items,
  });
  late final Label label;
  late final List<Items> items;

  Attributes.fromJson(Map<String, dynamic> json){
    label = Label.fromJson(json['label']);
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label.toJson();
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Label {
  Label({
    required this.id,
    required this.attributeId,
    required this.isGroup,
    required this.name,
  });
  late final int id;
  late final int attributeId;
  late final int isGroup;
  late final Name name;

  Label.fromJson(Map<String, dynamic> json){
    id = json['id'];
    attributeId = json['attribute_id'];
    isGroup = json['is_group'];
    name = Name.fromJson(json['name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attribute_id'] = attributeId;
    _data['is_group'] = isGroup;
    _data['name'] = name.toJson();
    return _data;
  }
}

class Items {
  Items({
    required this.id,
    required this.attributeId,
    required this.name,
    required this.price,
    required this.isCheck,
    required this.image,
  });
  late final int id;
  late final int attributeId;
  late final Name name;
  late final String price;
  late final int isCheck;
  late final String image;

  Items.fromJson(Map<String, dynamic> json){
    id = json['id'];
    attributeId = json['attribute_id'];
    name = Name.fromJson(json['name']);
    price = json['price'];
    isCheck = json['is_check'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attribute_id'] = attributeId;
    _data['name'] = name.toJson();
    _data['price'] = price;
    _data['is_check'] = isCheck;
    _data['image'] = image;
    return _data;
  }
}