import 'package:flutter/material.dart';
import 'package:latom_shop/misc/color.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            width: 110,
            child: Image.asset("assets/logo/logo_text.jpg"),
          ),
          SizedBox(height: 40),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "History Transaksi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
