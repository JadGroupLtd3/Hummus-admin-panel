// ignore_for_file: constant_identifier_names

class ApiUrl {
  static const String BASE_URL = 'https://test.jadmeals.online/api/v1';

  static const String REGISTER_URI = '/register';
  static const String LOGIN_URI = '/login';
  static const String LOGOUT_URI = '/logout/id';
  static const String Profile_Info = '/profile-info/';
  static const String Update_URI = '/update-profile';
  static const String Delete_URI = '/delete-profile/';
  static const String Add_Address_URI = '/customer/create-address';
  static const String All_Address_URI = '/customer/addresses/';
  static const String Delete_Address_URI = '/customer/delete-address/';
  static const String BANNERS_URI = '/customer/banner';
  static const String MENU_URI = '/customer/categories';
  static const String App_Settings = '/customer/setting';
  static const String Delivery_Time = '/customer/delivery-time';
  static const String Product_URI = '/meals/index';
  static const String Drinks_URI = '/meals/drinks';
  static const String SUB_CATEGORY_URI = '/sub-categories';
  static const String SUB_CATEGORY_BY_ID_URI = '/sub-category/id';
  static const String SEARCH_URI = '/meals/search/';
  static const String Send_Order = '/order/create';
  static const String order_History = '/order/history/';
  static const String update_password = '/update-password';
  static const String verify_phone = '/verify-phone/';
  static const String reSendOtp = '/send-otp-for-password/';
  static const String changeLang = '/update-local';
  static const String recommended = '/meals/recommended';
  static const String add_favorite = '/favorite/add';
  static const String get_favorite = '/favorite/index/';
  static const String ratingOrder = '/order/rate';
  static const String checkCoupon = '/order/check-coupon';

}
