// ignore_for_file: non_constant_identifier_names

class Images {
  static String get placeholder => 'placeholder'.png;

  static String get background => 'background'.png;

  static String get logo => 'logo'.png;

  static String get home => 'home'.svg;

  static String get coupon => 'coupon'.svg;

  static String get deal => 'deal'.svg;

  static String get home_work => 'home_work'.svg;

  static String get users => 'users'.svg;

  static String get category => 'category'.svg;

  static String get order => 'order'.svg;

  static String get order_details => 'order_details'.svg;

  static String get component => 'component'.svg;

  static String get Elements => 'Elements'.svg;

  static String get food => 'food'.svg;

  static String get hashtag => 'hashtag'.svg;

  static String get questions => 'questions'.svg;

  static String get language => 'language'.svg;

  static String get notifications => 'notifications'.svg;

  static String get settings => 'settings'.svg;

  static String get search_icon => 'search_icon'.svg;

  static String get dot => 'dot'.svg;

  static String get person => 'person'.svg;

  static String get correct => 'correct'.svg;

  static String get group => 'group'.svg;

  static String get edit => 'edit'.svg;

  static String get delete => 'delete'.svg;

  static String get add_photo => 'add_photo'.svg;

  static String get logo2 => 'Rectangle'.png;

  static String get close => 'close'.svg;

  static String get order_receive => 'order_receive'.svg;

  static String get delivery_price => 'delivery_price'.svg;

  static String get money => 'money'.svg;
}

extension on String {
  String get png => 'assets/images/$this.png';

  String get svg => 'assets/svg/$this.svg';
}

Map<String, dynamic> paymentImage = {};
