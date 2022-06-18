import 'package:flutter/material.dart';
import 'misc/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkRed,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/logo_splash.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "xyz123@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: MainBgColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: MainBgColor,
                onPrimary: DarkPurple,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("Edit Password"),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: MainBgColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Histori Transaksi",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: DarkPurple,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          color: DarkPurple,
                          size: 200,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Belum ada transaksi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: DarkPurple,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Top up sekarang"),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: DarkPurple,
                        onPrimary: MainBgColor,
                        minimumSize: Size(200, 50)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
