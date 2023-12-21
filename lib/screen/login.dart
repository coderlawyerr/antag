// /*
// bu sayfa giriş ekranı 2 tane text field  ekranı
//  bir tane giriş yapmak için  containerden bir buton oluşturduk
//  ona tıklanama özelliği verilsin diye gestura detector kullandıık

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/dashboard.dart';
import 'package:flutter_application_1/screen/shared.dart';
import 'package:flutter_application_1/widgets/textfield.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            child: Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //class dan objeyi oluşturuyoruz.
    SharedPreferencesHelper preferences = SharedPreferencesHelper();
    //Giriş yap butonu admin se diğer sayfaya geçicek. Yoksa showdialog göstericek.
    void loginPush() {
      //fonksiopn olusturduk doğruysa
      bool isAdmin =
          preferences.isAdmin(controller.text, passwordController.text);
      if (isAdmin) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        showDialogFunction(context);
      }
    }

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
                ),
                const SizedBox(height: 15),

                ///şifre
                CustomTextField(
                  controller: passwordController,
                  hintText: "Şifre",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                ///giriş yap butonu
                GestureDetector(
                  onTap: loginPush,
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
}
