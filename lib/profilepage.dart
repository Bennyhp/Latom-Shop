import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latom_shop/loginpage.dart';
import 'package:latom_shop/misc/color.dart';
import 'package:latom_shop/recieptpage.dart';
import 'package:latom_shop/ubahpassword.dart';

import 'controllers/imagecontroller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser!.email;
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Red,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: tinggi / 10),
          Center(
            child: Container(
              width: lebar / 2,
              height: tinggi / 4,
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
          Center(
            child: Text(
              email ?? "",
              style: TextStyle(
                color: MainBgColor,
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
                primary: MainBgColor,
                shape: StadiumBorder(),
                onPrimary: Red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("Ubah Password"),
              onPressed: () {
                Get.to(UbahPassword());
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: MainBgColor,
                shape: StadiumBorder(),
                onPrimary: Red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("Log Out"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.off(LoginPage());
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              height: tinggi * 0.535,
              width: lebar * 0.9,
              decoration: BoxDecoration(
                color: MainBgColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Histori Transaksi",
                    style: TextStyle(
                      color: Red,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("transaksi")
                          .where("nama_user", whereIn: [email]).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.size <= 0) {
                            return Container(
                              margin: EdgeInsets.all(50),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.receipt_long_outlined,
                                    size: tinggi / 4,
                                    color: Red,
                                  ),
                                  Text(
                                    "Belum ada transaksi",
                                    style: TextStyle(
                                      color: Red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            );
                          }
                          return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                children: snapshot.data!.docs
                                    .map(
                                      (e) => Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => RecieptPage(
                                                id: e.id,
                                                deskripsi: e.get("deskripsi"),
                                                harga: e.get("harga_transaksi"),
                                                jenis: e.get("jenis_topup"),
                                                metodeBayar:
                                                    e.get("metode_pembayaran"),
                                                namaGame: e.get("nama_game"),
                                                tanggal:
                                                    e.get("tanggal_transaksi"),
                                              ),
                                            );
                                          },
                                          onLongPress: () {
                                            Get.defaultDialog(
                                                title: "Peringatan",
                                                titleStyle:
                                                    TextStyle(color: Red),
                                                middleText:
                                                    "Yakin Ingin Menghapus?",
                                                middleTextStyle:
                                                    TextStyle(color: Red),
                                                buttonColor: Red,
                                                textConfirm: "Ya",
                                                confirmTextColor: MainBgColor,
                                                textCancel: "Tidak",
                                                cancelTextColor: Red,
                                                onConfirm: () {
                                                  FirebaseFirestore.instance
                                                      .collection("transaksi")
                                                      .doc(e.id)
                                                      .delete();
                                                  Get.back();
                                                });
                                          },
                                          child: Container(
                                            height: tinggi / 10,
                                            width: lebar,
                                            decoration: BoxDecoration(
                                              color: Red,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: ConstrainedBox(
                                                    constraints:
                                                        const BoxConstraints(
                                                      minWidth: 50,
                                                      minHeight: 50,
                                                      maxWidth: 50,
                                                      maxHeight: 50,
                                                    ),
                                                    child: FutureBuilder(
                                                      future: getImageDownloadURL(
                                                          e.get(
                                                              "gambar_transaksi")),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<String>
                                                              snapshot) {
                                                        if (snapshot.connectionState ==
                                                                ConnectionState
                                                                    .done &&
                                                            snapshot.hasData) {
                                                          return Image.network(
                                                            snapshot.data!,
                                                            fit: BoxFit.cover,
                                                          );
                                                        }
                                                        return const CircularProgressIndicator();
                                                      },
                                                    ),
                                                  ),
                                                  title: Text(
                                                    e.get("jenis_topup"),
                                                    style: TextStyle(
                                                        color: MainBgColor),
                                                  ),
                                                  subtitle: Text(
                                                    "Rp. " +
                                                        e
                                                            .get(
                                                                "harga_transaksi")
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: MainBgColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          );
                        }
                        return const CircularProgressIndicator();
                      },
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
