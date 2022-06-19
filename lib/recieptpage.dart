import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latom_shop/homepage.dart';
import 'package:latom_shop/misc/color.dart';

class RecieptPage extends StatelessWidget {
  const RecieptPage({
    Key? key,
    required this.id,
    required this.deskripsi,
    required this.harga,
    required this.jenis,
    required this.metodeBayar,
    required this.namaGame,
    required this.tanggal,
  }) : super(key: key);

  final String id;
  final String deskripsi;
  final int harga;
  final String jenis;
  final String metodeBayar;
  final String namaGame;
  final Timestamp tanggal;

  @override
  Widget build(BuildContext context) {
    DateTime tanggalTransaksi = tanggal.toDate();
    return Scaffold(
      backgroundColor: DarkRed,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MainBgColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Resi Pemesanan",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "ID Pembayaran: \n" + id,
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Tanggal Transaksi:\n" + tanggalTransaksi.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Nama Game:\n" + namaGame,
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "ID Player:\n" + deskripsi,
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Jenis Top-up:\n" + jenis,
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Harga Transaksi:\nRp. " + harga.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: DarkPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Metode Pembayaran:\n" + metodeBayar,
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
                      left: 15.0,
                      right: 10.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Kembali",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: DarkPurple,
                        onPrimary: MainBgColor,
                        minimumSize: Size(150, 60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
