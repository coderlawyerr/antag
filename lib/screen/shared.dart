import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Veri depolama ve kontrol işlemleri için SharedPreferences
// kullanımını sağlayan yardımcı sınıf
class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  SharedPreferencesHelper._();
  factory SharedPreferencesHelper() =>
      _instance ??= SharedPreferencesHelper._();
  SharedPreferences? _pref;

  // Verilen kullanıcı adı ve şifre ile yönetici
  // (admin) olup olmadığını kontrol eder
  bool isAdmin(String adminUserName, String adminPassword) {
    //
    String? savedUserName = _pref?.getString('username');
    String? savedPassword = _pref?.getString('password');

    if (savedUserName == adminUserName && savedPassword == adminPassword) {
      print(savedUserName);
      return true;
    } else {
      return false;
    }
  }

  // Giriş bilgilerini SharedPreferences'e kaydeder
  void savelogin(String adminUserName, String adminPassword) async {
    await _pref?.setString('username', adminUserName);
    await _pref?.setString('password', adminPassword);
  }

  // Kaydedilmiş giriş bilgilerini siler
  void deletelogin() async {
    await _pref?.remove('username');
    await _pref?.remove('password');
  }

////pref olustur degılse
  Future<SharedPreferences?> initialize() async {
    if (_pref != null) {
      return _pref;
    } else {
      _pref = await SharedPreferences.getInstance();
    }
  }
}
