// // Kullanıcı girişi için veri modelini temsil eden sınıf
// class LoginModel {
//   // Kullanıcıya ait e-posta adresi
//   String? mail;

//   // Kullanıcıya ait şifre
//   String? password;

//   // LoginModel sınıfının constructor'ı
//   LoginModel({
//     this.mail,
//     this.password,
//   });

//   // JSON verilerini LoginModel'e dönüştüren factory method
//   factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
//         mail: json["mail"],
//         password: json["password"],
//       );

//   // LoginModel'i JSON verilerine dönüştüren method
//   Map<String, dynamic> toMap() => {
//         "mail": mail,
//         "password": password,
//       };
// }
// bakim 