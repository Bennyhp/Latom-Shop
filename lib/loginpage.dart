import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/logregcontroller.dart';
import 'homepage.dart';
import 'misc/color.dart';
import 'regispage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MainBgColor,
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }
}

_header(context) {
  return Column(
    children: [
      Image.asset("assets/logo/logo.jpg"),
      Text(
        "Selamat Datang",
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: DarkPurple),
      ),
      Text(
        "Silahkan login terlebih dahulu",
        style: TextStyle(
          color: DarkPurple,
        ),
      ),
    ],
  );
}

_inputField(context) {
  LogRegControl tc = Get.put(LogRegControl());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        controller: tc.ctrlEmail,
        decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(
            Icons.person,
            color: DarkRed,
          ),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        controller: tc.ctrlPassword,
        decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(
            Icons.lock,
            color: DarkRed,
          ),
        ),
        obscureText: true,
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: tc.ctrlEmail.text.trim(),
                password: tc.ctrlPassword.text.trim());
            Get.off(HomePage());
          } on FirebaseAuthException catch (context) {
            tc.ctrlEmail.text = "";
            tc.ctrlPassword.text = "";
            Get.snackbar(
              "Login Gagal",
              "Pastikan Email dan Password Benar",
              duration: const Duration(seconds: 2),
              backgroundColor: Red,
              colorText: MainBgColor,
            );
          }
        },
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 16),
          primary: Red,
        ),
      )
    ],
  );
}

_signup(context) {
  LogRegControl tc = Get.put(LogRegControl());
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Belum punya akun? ",
        style: TextStyle(color: DarkPurple),
      ),
      TextButton(
          onPressed: () {
            tc.ctrlEmail.text = "";
            tc.ctrlPassword.text = "";
            Get.to(RegisPage());
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Red,
            ),
          ))
    ],
  );
}
