import 'package:flutter/material.dart';
import 'package:latom_shop/misc/color.dart';

class RecieptPage extends StatelessWidget {
  const RecieptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkRed,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MainBgColor,
          ),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "RESI PEMESANAN",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Nama Game :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Jenis Top Up :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Metode Pembayaran :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "ID Player :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Tanggal Transaksi :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Email :",
                    style: TextStyle(
                      fontSize: 15,
                      color: DarkPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "KEMBALI",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: DarkPurple,
                    onPrimary: MainBgColor,
                    minimumSize: Size(200, 60),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
