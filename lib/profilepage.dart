import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Center(
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/logo.jpg"),
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
                onPrimary: Colors.white,
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
              child: Column(
                children: [
                  Text(
                    "Histori Transaksi",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Top up sekarang",
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
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
