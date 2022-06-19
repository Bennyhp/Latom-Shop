import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/changepasscontroller.dart';
import 'misc/color.dart';

class UbahPassword extends StatelessWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MainBgColor,
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 100),
              _header(context),
              SizedBox(height: 50),
              _inputField(context),
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
          "Ubah Password",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: DarkPurple),
        ),
        SizedBox(height: 10),
        Text(
          "Silahkan Isi Form Di Bawah Ini",
          style: TextStyle(fontSize: 16, color: DarkPurple),
        )
      ],
    );
  }

  _inputField(context) {
    PassControl tc = Get.put(PassControl());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: tc.ctrlOldPass,
          decoration: InputDecoration(
            hintText: "Masukkan Password Lama",
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
        SizedBox(height: 20),
        TextField(
          controller: tc.ctrlNewPass,
          decoration: InputDecoration(
            hintText: "Masukkan Password Baru",
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
            var userID = FirebaseAuth.instance.currentUser;
            String? checkEmail = userID!.email;
            try {
              UserCredential userCredential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: checkEmail.toString().trim(),
                password: tc.ctrlOldPass.text.trim(),
              );
              userID.updatePassword(tc.ctrlNewPass.text).then(
                (_) {
                  tc.ctrlOldPass.text = "";
                  tc.ctrlNewPass.text = "";
                  Get.back();
                  Get.snackbar(
                    "Ubah Password Berhasil",
                    "Kembali Ke Halaman Profile",
                    duration: const Duration(seconds: 2),
                    backgroundColor: MainBgColor,
                    colorText: Red,
                  );
                },
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == "wrong-password") {
                tc.ctrlOldPass.text = "";
                tc.ctrlNewPass.text = "";
                Get.snackbar(
                  "Ubah Password Gagal",
                  "Password Lama Salah",
                  duration: const Duration(seconds: 2),
                  backgroundColor: Red,
                  colorText: MainBgColor,
                );
              } else if (e.code == "unknown") {
                tc.ctrlOldPass.text = "";
                tc.ctrlNewPass.text = "";
                Get.snackbar(
                  "Ubah Password Gagal",
                  "Inputan Tidak Boleh Kosong",
                  duration: const Duration(seconds: 2),
                  backgroundColor: Red,
                  colorText: MainBgColor,
                );
              }
            }
          },
          child: Text(
            "Ubah Password",
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
}
