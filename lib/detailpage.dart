import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/imagecontroller.dart';
import 'controllers/transaksicontroller.dart';
import 'misc/color.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.id,
    required this.nama_game,
    required this.label_game,
    required this.banner,
  }) : super(key: key);

  final String id;
  final String nama_game;
  final String label_game;
  final String banner;

  List<String> lst = [
    'assets/wallet/dana.png',
    'assets/wallet/gopay.png',
    'assets/wallet/ovo.png'
  ];

  @override
  Widget build(BuildContext context) {
    TextControl tc = Get.put(TextControl());
    RadioController rc = Get.put(RadioController());
    return Scaffold(
      backgroundColor: DarkRed,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: getImageDownloadURL(banner),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Image.network(
                      snapshot.data!,
                      fit: BoxFit.fitWidth,
                    );
                  }
                  return const CircularProgressIndicator();
                },
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
                    controller: tc.ctrlIDPlayer,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(color: DarkPurple),
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
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("topup")
                    .orderBy("harga_topup")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      padding: EdgeInsets.all(8),
                      childAspectRatio: 2 / 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data!.docs
                          .where((e) => label_game == e.get("label_topup"))
                          .map(
                            (e) => Obx(
                              () => InkWell(
                                onTap: () {
                                  rc.buttonTopup.value = e.id;
                                  rc.harga = e.get("harga_topup");
                                  rc.jenis = e.get("nama_topup");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: rc.buttonTopup.value == e.id
                                        ? Red
                                        : MainBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FutureBuilder(
                                            future: getImageDownloadURL(
                                                e.get("gambar_topup")),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<String>
                                                    snapshot) {
                                              if (snapshot.connectionState ==
                                                      ConnectionState.done &&
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
                                      ),
                                      Text(
                                        e.get("nama_topup"),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text("Rp. " +
                                          e.get("harga_topup").toString()),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              SizedBox(height: 25),
              Obx(
                () => Column(
                  children: [
                    customRadioBayar(
                      lst[0],
                      "Dana",
                    ),
                    customRadioBayar(
                      lst[1],
                      "GoPay",
                    ),
                    customRadioBayar(
                      lst[2],
                      "OVO",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 50,
                width: 150,
                child: OutlinedButton(
                  onPressed: () async {
                    var userId = FirebaseAuth.instance.currentUser!.email;
                    await FirebaseFirestore.instance
                        .collection("transaksi")
                        .add({
                      "deskripsi": tc.ctrlIDPlayer.text,
                      "harga_transaksi": rc.harga,
                      "jenis_topup": rc.jenis,
                      "metode_pembayaran": rc.buttonBayar.value,
                      "nama_game": nama_game,
                      "nama_user": userId,
                      "tanggal_transaksi": Timestamp.now(),
                    });
                  },
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
        ),
      ),
    );
  }
}

Widget customRadioBayar(String assets, String tipePembayaran) {
  final rc = Get.find<RadioController>();
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
    child: Container(
      child: ListTile(
        selected: rc.buttonBayar.value == tipePembayaran,
        selectedTileColor: Red,
        leading: Image.asset(assets),
        tileColor: MainBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {
          rc.setButtonBayar(tipePembayaran);
        },
      ),
    ),
  );
}
