class NotificationModel {
  NotificationModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final NotificationData data;

  NotificationModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = NotificationData.fromJson(json['data']);
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

class NotificationData {
  NotificationData({
    this.id,
    required this.newOrderStatus,
    required this.newOrderMessageAr,
    required this.newOrderMessageEn,
    required this.newOrderMessageHe,
    required this.orderAcceptStatus,
    required this.orderAcceptMessageAr,
    required this.orderAcceptMessageEn,
    required this.orderAcceptMessageHe,
    required this.orderRejectStatus,
    required this.orderRejectMessageAr,
    required this.orderRejectMessageEn,
    required this.orderRejectMessageHe,
    required this.orderPreparingStatus,
    required this.orderPreparingMessageAr,
    required this.orderPreparingMessageEn,
    required this.orderPreparingMessageHe,
    required this.orderWaitingPickupStatus,
    required this.orderWaitingPickupMessageAr,
    required this.orderWaitingPickupMessageEn,
    required this.orderWaitingPickupMessageHe,
    required this.orderWaitingDeliveryStatus,
    required this.orderWaitingDeliveryMessageAr,
    required this.orderWaitingDeliveryMessageEn,
    required this.orderWaitingDeliveryMessageHe,
    required this.orderOnTheWayStatus,
    required this.orderOnTheWayMessageAr,
    required this.orderOnTheWayMessageEn,
    required this.orderOnTheWayMessageHe,
    required this.orderDoneStatus,
    required this.orderDoneMessageAr,
    required this.orderDoneMessageEn,
    required this.orderDoneMessageHe,
    this.createdAt,
    this.updatedAt,
  });
  late final id;
  late final int newOrderStatus;
  late final String newOrderMessageAr;
  late final String newOrderMessageEn;
  late final String newOrderMessageHe;
  late final int orderAcceptStatus;
  late final String orderAcceptMessageAr;
  late final String orderAcceptMessageEn;
  late final String orderAcceptMessageHe;
  late final int orderRejectStatus;
  late final String orderRejectMessageAr;
  late final String orderRejectMessageEn;
  late final String orderRejectMessageHe;
  late final int orderPreparingStatus;
  late final String orderPreparingMessageAr;
  late final String orderPreparingMessageEn;
  late final String orderPreparingMessageHe;
  late final int orderWaitingPickupStatus;
  late final String orderWaitingPickupMessageAr;
  late final String orderWaitingPickupMessageEn;
  late final String orderWaitingPickupMessageHe;
  late final int orderWaitingDeliveryStatus;
  late final String orderWaitingDeliveryMessageAr;
  late final String? orderWaitingDeliveryMessageEn;
  late final String orderWaitingDeliveryMessageHe;
  late final int orderOnTheWayStatus;
  late final String orderOnTheWayMessageAr;
  late final String orderOnTheWayMessageEn;
  late final String orderOnTheWayMessageHe;
  late final int orderDoneStatus;
  late final String orderDoneMessageAr;
  late final String orderDoneMessageEn;
  late final String orderDoneMessageHe;
  late final createdAt;
  late final updatedAt;

  NotificationData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    newOrderStatus = json['new_order_status'];
    newOrderMessageAr = json['new_order_message_ar'];
    newOrderMessageEn = json['new_order_message_en'];
    newOrderMessageHe = json['new_order_message_he'];
    orderAcceptStatus = json['order_accept_status'];
    orderAcceptMessageAr = json['order_accept_message_ar'];
    orderAcceptMessageEn = json['order_accept_message_en'];
    orderAcceptMessageHe = json['order_accept_message_he'];
    orderRejectStatus = json['order_reject_status'];
    orderRejectMessageAr = json['order_reject_message_ar'];
    orderRejectMessageEn = json['order_reject_message_en'];
    orderRejectMessageHe = json['order_reject_message_he'];
    orderPreparingStatus = json['order_preparing_status'];
    orderPreparingMessageAr = json['order_preparing_message_ar'];
    orderPreparingMessageEn = json['order_preparing_message_en'];
    orderPreparingMessageHe = json['order_preparing_message_he'];
    orderWaitingPickupStatus = json['order_waiting_pickup_status'];
    orderWaitingPickupMessageAr = json['order_waiting_pickup_message_ar'];
    orderWaitingPickupMessageEn = json['order_waiting_pickup_message_en'];
    orderWaitingPickupMessageHe = json['order_waiting_pickup_message_he'];
    orderWaitingDeliveryStatus = json['order_waiting_delivery_status'];
    orderWaitingDeliveryMessageAr = json['order_waiting_delivery_message_ar'];
    orderWaitingDeliveryMessageEn = json['order_waiting_delivery_message_en'];
    orderWaitingDeliveryMessageHe = json['order_waiting_delivery_message_he'];
    orderOnTheWayStatus = json['order_on_the_way_status'];
    orderOnTheWayMessageAr = json['order_on_the_way_message_ar'];
    orderOnTheWayMessageEn = json['order_on_the_way_message_en'];
    orderOnTheWayMessageHe = json['order_on_the_way_message_he'];
    orderDoneStatus = json['order_done_status'];
    orderDoneMessageAr = json['order_done_message_ar'];
    orderDoneMessageEn = json['order_done_message_en'];
    orderDoneMessageHe = json['order_done_message_he'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['new_order_status'] = newOrderStatus;
    _data['new_order_message_ar'] = newOrderMessageAr;
    _data['new_order_message_en'] = newOrderMessageEn;
    _data['new_order_message_he'] = newOrderMessageHe;
    _data['order_accept_status'] = orderAcceptStatus;
    _data['order_accept_message_ar'] = orderAcceptMessageAr;
    _data['order_accept_message_en'] = orderAcceptMessageEn;
    _data['order_accept_message_he'] = orderAcceptMessageHe;
    _data['order_reject_status'] = orderRejectStatus;
    _data['order_reject_message_ar'] = orderRejectMessageAr;
    _data['order_reject_message_en'] = orderRejectMessageEn;
    _data['order_reject_message_he'] = orderRejectMessageHe;
    _data['order_preparing_status'] = orderPreparingStatus;
    _data['order_preparing_message_ar'] = orderPreparingMessageAr;
    _data['order_preparing_message_en'] = orderPreparingMessageEn;
    _data['order_preparing_message_he'] = orderPreparingMessageHe;
    _data['order_waiting_pickup_status'] = orderWaitingPickupStatus;
    _data['order_waiting_pickup_message_ar'] = orderWaitingPickupMessageAr;
    _data['order_waiting_pickup_message_en'] = orderWaitingPickupMessageEn;
    _data['order_waiting_pickup_message_he'] = orderWaitingPickupMessageHe;
    _data['order_waiting_delivery_status'] = orderWaitingDeliveryStatus;
    _data['order_waiting_delivery_message_ar'] = orderWaitingDeliveryMessageAr;
    _data['order_waiting_delivery_message_en'] = orderWaitingDeliveryMessageEn;
    _data['order_waiting_delivery_message_he'] = orderWaitingDeliveryMessageHe;
    _data['order_on_the_way_status'] = orderOnTheWayStatus;
    _data['order_on_the_way_message_ar'] = orderOnTheWayMessageAr;
    _data['order_on_the_way_message_en'] = orderOnTheWayMessageEn;
    _data['order_on_the_way_message_he'] = orderOnTheWayMessageHe;
    _data['order_done_status'] = orderDoneStatus;
    _data['order_done_message_ar'] = orderDoneMessageAr;
    _data['order_done_message_en'] = orderDoneMessageEn;
    _data['order_done_message_he'] = orderDoneMessageHe;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}