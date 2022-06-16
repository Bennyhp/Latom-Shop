import 'package:flutter/material.dart';
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "Username",
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
        onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            )),
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
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Belum punya akun? ",
        style: TextStyle(color: DarkPurple),
      ),
      TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RegisPage(),
              )),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Red,
            ),
          ))
    ],
  );
}
