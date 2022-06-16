import 'package:flutter/material.dart';
import 'misc/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
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
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          color: DarkPurple,
                          size: 230,
                        )
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
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Top up sekarang",
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
