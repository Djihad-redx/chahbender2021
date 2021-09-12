// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "Hompage": "الصفحة الرئيسية",
  "Settings": "الاعدات",
  "Languages": "اللغات",
  "Notifications": "الاشعارات",
  "Currency": "العملات",
  "Deactivate account": "تعطيل الحساب",
  "Terms of services": "شروط الخدمة",
  "Privacy Policy": "سياسة الخصوصية",
  "About": "حول",
  "FAQs": "FAQs",
  "Sign-out": "تسجيل الخروج",
  "Search": "بحث",
};
static const Map<String,dynamic> en = {
  "Hompage": "Home Page",
  "Settings": "Settings",
  "Languages": "Languages",
  "Deactivate account": "Deactivate account",
  "Terms of services": "Terms of services",
  "Privacy Policy": "Privacy Policy",
  "About": "About",
  "FAQs": "FAQs",
  "Sign-out": "Sign-out",
  "Search": "Search",
};
  static const Map<String,dynamic> tr = {
    "Hompage": "ana Sayfa",
    "Settings": "Ayarlay",
    "Languages": "Diller",
    "Notifications": "Bildirimler",
    "Currency": "Para",
    "Deactivate account": "Hesap Kapma",
    "Terms of services": "Kullanım Şartları",
    "Privacy Policy": "Gizlilik Politikası",
    "About": "Hakkında",
    "FAQs": "FAQs",
    "Sign-out": "çıkış Yap",
    "Search": "arama",
  };
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en,"tr":tr};
}
