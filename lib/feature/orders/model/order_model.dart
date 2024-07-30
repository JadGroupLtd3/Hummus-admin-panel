import 'dart:convert';
import 'package:equatable/equatable.dart';

AllOrderModel allOrderModelFromJson(String str) =>
    AllOrderModel.fromJson(json.decode(str));

String allOrderModelToJson(AllOrderModel data) => json.encode(data.toJson());

class AllOrderModel {
  late final int code;
  late final bool status;
  late final String message;
  late final List<AllOrders> data;

  AllOrderModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllOrderModel.fromJson(Map<String, dynamic> json) => AllOrderModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: List<AllOrders>.from(
        json["data"].map((x) => AllOrders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllOrders extends Equatable {
  late final id;
  late final itemCount;
  late final totalPrice;
  late final isDelivery;
  late final approveStatus;
  late final executionTime;
  late final executionStep;
  late final paymentType;
  late final isPayment;
  late final orderType;
  late bool isExpanded;
  late final String? note;
  late final createdAt;
  late final Customer? customer;
  late final customerAddressId;
  late final deliveryTime;
  late final List<Meal>? meals;

  AllOrders({
    this.id,
    this.itemCount,
    this.totalPrice,
    this.isDelivery,
    this.approveStatus,
    this.executionTime,
    this.executionStep,
    this.isExpanded = false,
    this.paymentType,
    this.isPayment,
    this.orderType,
    this.note,
    this.createdAt,
    this.customer,
    this.customerAddressId,
    this.deliveryTime,
    this.meals,
  });

  factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
    id: json["id"],
    itemCount: json["item_count"],
    totalPrice: json["total_price"],
    isDelivery: json["is_delivery"],
    approveStatus: json["approve_status"],
    executionTime: json["execution_time"],
    executionStep: json["execution_step"],
    paymentType: json["payment_type"],
    isPayment: json["is_payment"],
    orderType: json["order_type"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    customer: Customer.fromJson(json["customer"]),
    customerAddressId: json["customer_address_id"],
    deliveryTime: json["delivery_time"],
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_count": itemCount,
    "total_price": totalPrice,
    "is_delivery": isDelivery,
    "approve_status": approveStatus,
    "execution_time": executionTime,
    "execution_step": executionStep,
    "payment_type": paymentTypeValues.reverse[paymentType],
    "is_payment": isPayment,
    "order_type": orderType,
    "note": note,
    "created_at": createdAt.toIso8601String(),
    "customer": customer?.toJson(),
    "customer_address_id": customerAddressId,
    "delivery_time": deliveryTime,
    "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [
    id,
    itemCount,
    totalPrice,
    isDelivery,
    approveStatus,
    executionTime,
    executionStep,
    paymentType,
    isPayment,
    orderType,
    isExpanded,
    note,
    createdAt,
    customer,
    customerAddressId,
    deliveryTime,
    meals
  ];
}

class Customer extends Equatable {
  late final int id;
  late final String name;
  late final String phone;
  late final String image;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "image": image,
  };

  @override
  List<Object?> get props => [name, phone, image, id];
}

class Meal extends Equatable {
  late final int id;
  late final String quantity;
  late final String price;
  late final Description name;
  late final Description description;
  late final String primaryImage;
  late final List<Component> components;

  Meal({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.description,
    required this.primaryImage,
    required this.components,
  });

  String generateReceiptString(String locale) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln("");

    for (var component in components) {
      String itemName;
      if (locale == 'en') {
        itemName = component.name.en;
      } else {
        itemName = locale == 'ar' ? component.name.ar : component.name.he;
      }

      // Smaller padding for a more conservative approach
      final padding = 30 - itemName.length;
      final paddingString = ''.padRight(padding > 0 ? padding : 1);

      if (locale == 'en') {
        buffer.writeln("   -  $itemName$paddingString");
      } else {
        buffer.writeln("   -  $itemName$paddingString"); // No dashes added
      }
    }

    buffer.writeln("");
    return buffer.toString();
  }

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json["id"],
    quantity: json["quantity"],
    price: json["price"],
    name: Description.fromJson(json["name"]),
    description: Description.fromJson(json["description"]),
    primaryImage: json["primary_image"],
    components: List<Component>.from(
        json["components"].map((x) => Component.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "price": price,
    "name": name.toJson(),
    "description": description.toJson(),
    "primary_image": primaryImage,
    "components": List<dynamic>.from(components.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props =>
      throw [id, quantity, price, name, description, primaryImage, components];
}

class Component extends Equatable {
  late final int? attributeId;
  late final Description? label;
  late final Description name;
  late final String image;
  late final int? componentId;
  late final bool isAttribute;

  Component({
    this.attributeId,
    this.label,
    required this.name,
    required this.image,
    this.componentId,
    this.isAttribute = false,
  });

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    attributeId: json["attribute_id"] ?? json["component_id"],
    label:
    json["label"] == null ? null : Description.fromJson(json["label"]),
    name: Description.fromJson(json["name"]),
    image: json["image"],
    componentId: json["component_id"],
    isAttribute: json["attribute_id"] == null ? false : true,
  );

  Map<String, dynamic> toJson() => {
    "attribute_id": attributeId,
    "label": label?.toJson(),
    "name": name.toJson(),
    "image": image,
    "component_id": componentId,
  };

  @override
  List<Object?> get props =>
      [attributeId, label, name, image, componentId, isAttribute];
}

class Description extends Equatable {
  late final String ar;
  late final String en;
  late final String he;

  Description({
    required this.ar,
    required this.en,
    required this.he,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    ar: json["ar"],
    en: json["en"],
    he: json["he"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "en": en,
    "he": he,
  };

  @override
  List<Object?> get props => [ar, en, he];
}

enum PaymentType { COD, VISA }

late final paymentTypeValues =
EnumValues({"COD": PaymentType.COD, "VISA": PaymentType.VISA});

class EnumValues<T> extends Equatable {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }

  @override
  List<Object?> get props => [map, reverseMap];
}