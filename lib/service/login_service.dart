import 'dart:convert';
import 'package:flutter_application_1/screen/shared.dart';
import 'package:http/http.dart' as http;

// Global değişkenler veya sabitler
String serviceStatus = "";
Map<String, String> header = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  // İhtiyaca göre diğer başlıkları ekleyin
};

class User {
  bool? success;
  Result? result;

  User({
    this.success,
    this.result,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        success: json["success"],
        result:
            json["result"] is String ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": result?.toMap(),
      };
}

class Result {
  int? userId;
  int? farmId;
  String? nameSurname;

  Result({
    this.userId,
    this.farmId,
    this.nameSurname,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userId"],
        farmId: json["farmId"],
        nameSurname: json["nameSurname"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "farmId": farmId,
        "nameSurname": nameSurname,
      };
}
//

class LoginService {
  Future<User?> loginfnc({String? mail, String? password}) async {
    // API endpoint URL'sini tanımla
    const String apiUrl = "https://mapi.antag.com.tr/Login";

    // E-posta ve şifreyi içeren istek gövdesi için bir harita oluştur
    Map<String, dynamic> resbody = {
      //72-75 gonderılecek olan verının map formatında hazırlanması
      "mail": mail,
      "password": password,
    };
    String bodys = json.encode(resbody);

    ///istek atarken strınge donusturuyoruz usttekı objeyı

    // Belirtilen API endpoint'ine başlık ve gövde ile POST isteği yap
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: header,
      body: bodys,
    );
    // Hata ayıklama: Yanıt detaylarını yazdır
    print("response.statusCode: ${response.statusCode}");
    print("response.body: ${response.body.toString()}");

    // Yanıtın durum kodunu kontrol et
    if (response.statusCode == 200) {
      serviceStatus = "Servis Başarılı"; // Servis Başarılı

      // gelen veriyi modele dönüştür
      final User userModel = User.fromJson(response.body);

      return userModel;
    } else if (response.statusCode == 404) {
      serviceStatus = "404 Sunucu Servis Hatası"; // 404 Sunucu Servis Hatası
      return null;
    } else {
      throw Exception(
        "Servis 'loginfnc', statusCode: ${response.statusCode} ile başarısız oldu",
      );
    }
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Dashboard {
  bool? success;
  DashResult? result;

  Dashboard({
    this.success,
    this.result,
  });

  factory Dashboard.fromJson(String str) => Dashboard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dashboard.fromMap(Map<String, dynamic> json) => Dashboard(
        success: json["success"],
        result:
            json["result"] == null ? null : DashResult.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": result?.toMap(),
      };
}

class DashResult {
  Map<String, int>? animalsCount;
  Map<String, int>? animalsAlertCount;

  DashResult({
    this.animalsCount,
    this.animalsAlertCount,
  });

  factory DashResult.fromJson(String str) =>
      DashResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashResult.fromMap(Map<String, dynamic> json) => DashResult(
        animalsCount: Map.from(json["animalsCount"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        animalsAlertCount: Map.from(json["animalsAlertCount"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toMap() => {
        "animalsCount": Map.from(animalsCount!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "animalsAlertCount": Map.from(animalsAlertCount!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class DashboardService {
  Future<Dashboard?> getDashboard() async {
    const String apiUrl = "https://mapi.antag.com.tr/Dashboard";

    // cihaz üzerine kayıtlı farmId değerini getir
    final farmId = SharedPreferencesHelper().getFarmId();

    // Göndermemiz gereken veri
    final Map<String, dynamic> resbody = {"farmId": farmId};

    // üstteki veriyi apiUrl'e ekliyoruz (get isteği olduğu için)
    final newApiUrl = Uri.parse(apiUrl).replace(queryParameters: resbody);
    // yeni url buna dönüşüyor : https://mapi.antag.com.tr/Dashboard?farmId=veri

    // adrese istek atıyoruz
    final response = await http.get(newApiUrl);

    if (response.statusCode == 200) {
      // başarılı
      final Dashboard dashboardModel = Dashboard.fromJson(response.body);
      return dashboardModel;
    } else {
      // başarısız
      return null;
    }
  }
}
