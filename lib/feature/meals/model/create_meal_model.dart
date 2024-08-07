class CreateMealModel {
  CreateMealModel({
    required this.categoryId,
    required this.fakePrice,
    required this.price,
    this.image,
    this.id,
    required this.texts,
    required this.images,
    required this.hashtags,
    required this.components,
    required this.attributes,
    required this.homeCategories,
    required this.relatedProducts,
    required this.coinPoints,
  });
  late final int categoryId;
  late final id;
  late final fakePrice;
  late final price;
  late final String? image;
  late final List<CreateTexts> texts;
  late final List<CreateMealImages> images;
  late final List<CreateHashtags> hashtags;
  late final List<CreateComponents> components;
  late final List<CreateAttributes> attributes;
  late final List<CreateHomeCategories> homeCategories;
  late final List<CreateRelatedProducts> relatedProducts;
  late final coinPoints;

  CreateMealModel.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    fakePrice = json['fake_price'];
    price = json['price'];
    image = json['image'];
    texts = List.from(json['texts']).map((e)=>CreateTexts.fromJson(e)).toList();
    images = List.from(json['images']).map((e)=>CreateMealImages.fromJson(e)).toList();
    hashtags = List.from(json['hashtags']).map((e)=>CreateHashtags.fromJson(e)).toList();
    components = List.from(json['components']).map((e)=>CreateComponents.fromJson(e)).toList();
    attributes = List.from(json['attributes']).map((e)=>CreateAttributes.fromJson(e)).toList();
    homeCategories = List.from(json['home_categories']).map((e)=>CreateHomeCategories.fromJson(e)).toList();
    relatedProducts = List.from(json['related_products']).map((e)=>CreateRelatedProducts.fromJson(e)).toList();
    coinPoints = json['coin_points'];
  }

  Map<String, String> decodeImage() {
    final Map<String, String> componentList = {};
    for (int i = 0; i < images.length; i++) {
      componentList.addAll({
        'images[$i][image]': images[i].image,
      });
    }
    return componentList;
  }

  Map<String, String> decodeComponent() {
    final Map<String, String> componentList = {};
    for (int i = 0; i < components.length; i++) {
      componentList.addAll({
        'components[$i][component_id]': components[i].componentId.toString(),
        'components[$i][status]': components[i].status.toString(),
        'components[$i][is_default]': components[i].isDefault.toString(),
        'components[$i][price]': components[i].price.toString()
      });
    }
    return componentList;
  }

  Map<String, String> decodeHashtag() {
    final Map<String, String> hashtagList = {};
    for (int i = 0; i < hashtags.length; i++) {
      hashtagList.addAll({
        'hashtags[$i][hashtag_id]': hashtags[i].hashtagId.toString(),
      });
    }
    return hashtagList;
  }

  Map<String, String> decodeAttribute() {
    final Map<String, String> attributeList = {};
    for (int i = 0; i < attributes.length; i++) {
      attributeList.addAll({
        'attributes[$i][attribute_id]': attributes[i].attributeId.toString(),
        'attributes[$i][image]': attributes[i].image ?? '',
        'attributes[$i][name_ar]': attributes[i].nameAr ?? '',
        'attributes[$i][name_en]': attributes[i].nameEn ?? '',
        'attributes[$i][name_he]': attributes[i].nameHe ?? '',
        'attributes[$i][is_check]': attributes[i].isCheck.toString(),
        'attributes[$i][price]': attributes[i].price.toString(),
      });
    }
    return attributeList;
  }

  Map<String, String> decodeLang() {
    final Map<String, String> langList = {};
    for (int i = 0; i < texts.length; i++) {
      langList.addAll({
        'texts[$i][name]': texts[i].name,
        'texts[$i][description]': texts[i].description,
        'texts[$i][lang]': texts[i].lang
      });
    }
    return langList;
  }

  Map<String, String> decodeHomeProduct() {
    final Map<String, String> homeCategoriesList = {};
    for (int i = 0; i < homeCategories.length; i++) {
      homeCategoriesList.addAll({
        'home_categories[$i][type]': homeCategories[i].type,
      });
    }
    return homeCategoriesList;
  }

  Map<String, String> decodeRelated() {
    final Map<String, String> relatedList = {};
    for (int i = 0; i < relatedProducts.length; i++) {
      relatedList.addAll({
        'related_products[$i][related_product_id]': relatedProducts[i].relatedProductId.toString(),
      });
    }
    return relatedList;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['fake_price'] = fakePrice;
    _data['price'] = price;
    _data['image'] = image;
    _data['texts'] = texts.map((e)=>e.toJson()).toList();
    _data['images'] = images.map((e)=>e.toJson()).toList();
    _data['hashtags'] = hashtags.map((e)=>e.toJson()).toList();
    _data['components'] = components.map((e)=>e.toJson()).toList();
    _data['attributes'] = attributes.map((e)=>e.toJson()).toList();
    _data['home_categories'] = homeCategories.map((e)=>e.toJson()).toList();
    _data['related_products'] = relatedProducts.map((e)=>e.toJson()).toList();
    _data['coin_points'] = coinPoints;
    return _data;
  }
}

class CreateTexts {
  CreateTexts({
    required this.name,
    required this.description,
    required this.lang,
  });
  late final String name;
  late final String description;
  late final String lang;

  CreateTexts.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['lang'] = lang;
    return _data;
  }
}

class CreateMealImages {
  CreateMealImages({
    required this.image,
  });
  late final String image;

  CreateMealImages.fromJson(Map<String, dynamic> json){
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    return _data;
  }
}

class CreateHashtags {
  CreateHashtags({
    required this.hashtagId,
  });
  late final int hashtagId;

  CreateHashtags.fromJson(Map<String, dynamic> json){
    hashtagId = json['hashtag_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hashtag_id'] = hashtagId;
    return _data;
  }
}

class CreateComponents {
  CreateComponents({
    required this.componentId,
    required this.status,
    required this.isDefault,
    required this.price,
  });
  late final int componentId;
  late final int status;
  int? isDefault;
  int? price;

  CreateComponents.fromJson(Map<String, dynamic> json){
    componentId = json['component_id'];
    status = json['status'];
    isDefault = json['is_default'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['component_id'] = componentId;
    _data['status'] = status;
    _data['is_default'] = isDefault;
    _data['price'] = price;
    return _data;
  }
}

class CreateAttributes {
  CreateAttributes({
    required this.attributeId,
    this.image,
    this.attributeName,
    this.nameAr,
    this.nameEn,
    this.nameHe,
    this.isCheck,
    this.price,
  });
  late final int attributeId;
  String? image;
  String? attributeName;
  String? nameAr;
  String? nameEn;
  String? nameHe;
  int? isCheck;
  int? price;

  CreateAttributes.fromJson(Map<String, dynamic> json){
    attributeId = json['attribute_id'];
    image = json['image'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameHe = json['name_he'];
    isCheck = json['is_check'];
    price = json['price'];
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attribute_id'] = attributeId;
    _data['image'] = image;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['name_he'] = nameHe;
    _data['is_check'] = isCheck;
    _data['price'] = price;
    return _data;
  }
}

class CreateHomeCategories {
  CreateHomeCategories({
    required this.type,
  });
  late final String type;

  CreateHomeCategories.fromJson(Map<String, dynamic> json){
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    return _data;
  }
}

class CreateRelatedProducts {
  CreateRelatedProducts({
    required this.relatedProductId,
  });
  late final int relatedProductId;

  CreateRelatedProducts.fromJson(Map<String, dynamic> json){
    relatedProductId = json['related_product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['related_product_id'] = relatedProductId;
    return _data;
  }
}