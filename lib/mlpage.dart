import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/radiocontroller.dart';
import 'misc/color.dart';

class MLPage extends StatelessWidget {
  MLPage({Key? key}) : super(key: key);

  List<String> lst = [
    'assets/wallet/dana.png',
    'assets/wallet/gopay.png',
    'assets/wallet/ovo.png'
  ];

  List<String> listtxt = [
    'Test 1',
    'Test 2',
    'Test 3',
    'Test 4',
    'Test 5',
    'Test 6',
  ];

  @override
  Widget build(BuildContext context) {
    RadioController rc = Get.put(RadioController());
    return Scaffold(
      backgroundColor: DarkPurple,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              color: MainBgColor,
              child: Image.asset(
                "assets/games/ml_banner.jpeg",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(color: MainBgColor),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: DarkPurple),
                    hintText: "Masukkan ID",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: MainBgColor,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 290,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  children: [
                    customRadio(listtxt[0], 0),
                    customRadio(listtxt[1], 0),
                    customRadio(listtxt[2], 0),
                    customRadio(listtxt[3], 0),
                    customRadio(listtxt[4], 0),
                    customRadio(listtxt[5], 0),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                customRadioBayar(lst[0], 0),
                customRadioBayar(lst[1], 0),
                customRadioBayar(lst[2], 0),
              ],
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(color: MainBgColor),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: DarkPurple),
                    hintText: "Masukkan Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: MainBgColor,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              width: 150,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: MainBgColor,
                  primary: Red,
                ),
                child: Text(
                  "BELI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      )),
    );
  }

  Widget customRadio(String isi, int index) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(isi),
      style: OutlinedButton.styleFrom(
        backgroundColor: MainBgColor,
        primary: Red,
      ),
    );
  }
}

Widget customRadioBayar(String assets, int index) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
    child: Container(
      child: ListTile(
        selectedColor: DarkPurple,
        leading: Image.asset(assets),
        tileColor: MainBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {},
      ),
    ),
  );
}
