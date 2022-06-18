import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/logregcontroller.dart';
import 'misc/color.dart';

class RegisPage extends StatelessWidget {
  const RegisPage({Key? key}) : super(key: key);

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
              _login(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 50,
          padding: EdgeInsets.only(
            right: 170,
          ),
          child: Image.asset("assets/logo/logo_name.jpg"),
        ),
        SizedBox(height: 30),
        Text(
          "Form Registrasi",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: DarkPurple),
        ),
        SizedBox(height: 10),
        Text(
          "Isi form terlebih dahulu",
          style: TextStyle(fontSize: 16, color: DarkPurple),
        )
      ],
    );
  }

  _inputField(context) {
    LogRegControl tc = Get.put(LogRegControl());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50),
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
        SizedBox(height: 20),
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
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: tc.ctrlEmail.text, password: tc.ctrlPassword.text);
              tc.ctrlEmail.text = "";
              tc.ctrlPassword.text = "";
              Get.back();
              Get.snackbar(
                "Registrasi Berhasil",
                "Silahkan Login",
                duration: const Duration(seconds: 2),
                backgroundColor: Red,
                colorText: MainBgColor,
              );
            } on FirebaseAuthException catch (context) {
              tc.ctrlEmail.text = "";
              tc.ctrlPassword.text = "";
              Get.snackbar(
                "Registrasi Gagal",
                "Pastikan Format Email Benar dan Panjang Password Lebih Dari 5",
                duration: const Duration(seconds: 2),
                backgroundColor: Red,
                colorText: MainBgColor,
              );
            }
          },
          child: Text(
            "Registrasi",
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

  _login(context) {
    LogRegControl tc = Get.put(LogRegControl());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Sudah punya akun? "),
        TextButton(
          onPressed: () {
            tc.ctrlEmail.text = "";
            tc.ctrlPassword.text = "";
            Get.back();
          },
          child: Text(
            "Sign In",
            style: TextStyle(color: Red),
          ),
        )
      ],
    );
  }
}
