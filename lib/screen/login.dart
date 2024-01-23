// /*
// bu sayfa giriş ekranı 2 tane text field  ekranı
//  bir tane giriş yapmak için  containerden bir buton oluşturduk
//  ona tıklanama özelliği verilsin diye gestura detector kullandıık

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/login_model.dart';
import 'package:flutter_application_1/screen/shared.dart';
import 'package:flutter_application_1/service/login_service.dart';
import 'package:flutter_application_1/widgets/navbar.dart';
import 'package:flutter_application_1/widgets/textfield.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginService loginService = LoginService();

  final TextEditingController controller = TextEditingController();

  String adminUserName = "";

  final TextEditingController passwordController = TextEditingController();

  String adminPassword = "";

  //eğer admin değilse popup Mesajı çıkıcak.
  void showDialogFunction(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Şifreniz yanlış, sakinleşin ve tekrar deneyin!"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ///arka plana resim ekleme
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
// const SizedBox(height: 150),

                ///kullanıcı Adı
                CustomTextField(
                  controller: controller,
                  hintText: "Kullanıcı Adı",
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),

                ///şifre
                CustomTextField(
                  controller: passwordController,
                  hintText: "Şifre",
                  textInputAction: TextInputAction.done,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                ///giriş yap butonu
                InkWell(
                  onTap: () => loginPush(context),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
//şifremi unuttum kısmı
                const Text(
                  "şifremi unuttum",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

/////kaydetme ıslemı
  Future<void> loginPush(BuildContext context) async {
    // Kullanıcıdan alınan kullanıcı adı ve şifre
    String adminUserName = controller.text;
    String adminPassword = passwordController.text;

    // Kullanıcının giriş yapma işlemini başlat ve sonucu bekler
    User? userModel = await loginService.loginfnc(
        mail: adminUserName, password: adminPassword);

    // Debug amaçlı: Giriş işleminin sonucunu konsola yazdır
    debugPrint("result: ${userModel?.success}");

    if (userModel != null) {
      // Kullanıcı giriş bilgilerini yerel depolamaya kaydet
      SharedPreferencesHelper()
          .savelogin(adminUserName, adminPassword, userModel.result!.farmId!);

      // Giriş başarılıysa belirtilen sayfaya yönlendirme yap
      // context hala hayatta mı kontrol et
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationBarExample(),
          ),
        );
      }
    } else {
      // giriş başarılı değilse
      if (context.mounted) showDialogFunction(context);
    }
  }
}
