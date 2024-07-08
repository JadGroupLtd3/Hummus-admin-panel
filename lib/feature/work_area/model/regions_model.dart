class RegionsModel {
  RegionsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  late final int code;
  late final bool status;
  late final String message;
  late final List<RegionsData> data;

  RegionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => RegionsData.fromJson(e)).toList();
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

class RegionsData {
  RegionsData({
    this.id,
    required this.name,
    required this.regions,
  });

  late final id;
  late final String name;
  late final List<Regions> regions;

  RegionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regions =
        List.from(json['regions']).map((e) => Regions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['regions'] = regions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Regions {
  Regions({
    required this.lat,
    required this.lng,
  });

  late final String lat;
  late final String lng;

  Regions.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}

class CreateRegionsModel {
  CreateRegionsModel({
    required this.name,
    required this.status,
    required this.regions,
  });

  late final String name;
  late final status;
  late final List<Regions> regions;
  late final int code;
  late final String message;
  late final List<dynamic> data;

  CreateRegionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, String> decodeRegions() {
    final Map<String, String> regionsList = {};
    for (int i = 0; i < regions.length; i++) {
      regionsList.addAll({
        'lat': regions[i].lat,
        'lng': regions[i].lng,
      });
    }
    return regionsList;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['status'] = status;
    _data['regions'] = regions.map((region) => {'lat': region.lat, 'lng': region.lng,}).toList();
    return _data;
  }
}

class CreateRegions {
  CreateRegions({
    required this.lat,
    required this.lng,
  });

  late final String lat;
  late final String lng;

  CreateRegions.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}
