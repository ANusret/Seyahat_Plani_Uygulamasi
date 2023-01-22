import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gmap/auth_service.dart';
import 'package:gmap/custom_text_button.dart';

import 'kayitlirota.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  late String email, sifre;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffd1c4e9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/log3.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    baslikText(),
                    input_bosluk(),
                    emailTextField(),
                    input_bosluk(),
                    sifreTextField(),
                    input_bosluk(),
                    input_bosluk(),
                    giris_yap(),
                    input_bosluk(),
                    kayit_ol(),
                    CustomTextButton(
                      onPressed: () async {
                        final result = await authService.signInAnonymous();
                        if (result != null) {
                          Navigator.pushReplacementNamed(context, "/map");
                        } else {
                          print("Hata ile Karşılaşıldı !!!");
                        }
                      },
                      buttonText: "Misafir Girişi",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextButton giris_yap() {
    return TextButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          try {
            final kullanici = await firebaseAuth.signInWithEmailAndPassword(
                email: email, password: sifre);
            print(kullanici.user!.email);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => rotalar()));
          } catch (e) {
            print(e.toString());
          }
        } else {}
      },
      child: Text(
        "Giriş Yap",
        style: TextStyle(color: Colors.deepPurple, fontSize: 17),
      ),
    );
  }

  TextButton kayit_ol() {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, "/signUp"),
      child: Text(
        "Kayıt Ol",
        style: TextStyle(color: Colors.indigoAccent, fontSize: 17),
      ),
    );
  }

  Text baslikText() {
    return Text(
      "Merhaba \nHoşgeldiniz  ",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen E-mail bilgisi giriniz.!";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Colors.black),
      decoration: input_dekor("E-mail"),
    );
  }

  TextFormField sifreTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen Şifre bilgisi giriniz.!";
        }
      },
      onSaved: (value) {
        sifre = value!;
      },
      style: TextStyle(color: Colors.black),
      decoration: input_dekor("Şifre"),
      obscureText: true,
    );
  }

  Widget input_bosluk() => SizedBox(
        height: 26,
      );

  InputDecoration input_dekor(String hintText) {
    return InputDecoration(
      hintText: hintText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
