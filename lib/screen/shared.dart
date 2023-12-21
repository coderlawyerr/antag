import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  String adminPassword = "1907";

////admın sıfre kontrol edılmesı
  bool isAdmin(String adminUserName, String adminPassword) {
    if (adminPassword == '1907' && adminUserName == 'aa') {
      return true;
    } else {
      return false;
    }
  }

  //SharedPreferences nesnesi oluşturuluyor.
  SharedPreferences? _pref;
  Future<SharedPreferences?> initialize() async {
    if (_pref != null) {
      return _pref;
    } else {
      _pref = await SharedPreferences.getInstance();
    }
    return null;
  }
//shared prefs üzerine mail adresini kayıt edıyoruz

  // bu fonksiyon içine alınan mail'i 'mail' anahtarına kaydediyor.
  //  Future<bool> saveMail(String mail) async {
  //   return await _pref.setString('mail', mail);
  // }

  // bu fonksiyon içine alınan şifreyi 'password' anahtarına kaydediyor.
  //  Future<bool> savePassword(String password) async {
  //   return await _pref.setString('password', password);
  // }
}
