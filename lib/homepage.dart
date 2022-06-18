import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detailpage.dart';
import 'controllers/imagecontroller.dart';
import 'profilepage.dart';
import 'misc/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageComps(),
      bottomNavigationBar: BodyNavBar(),
    );
  }
}

class HomePageComps extends StatelessWidget {
  const HomePageComps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkRed,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 200,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("promo")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return PageView(
                        pageSnapping: true,
                        children: snapshot.data!.docs
                            .map(
                              (e) => ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FutureBuilder(
                                  future: getImageDownloadURL(
                                      e.get("gambar_promo")),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.hasData) {
                                      return Image.network(
                                        snapshot.data!,
                                        fit: BoxFit.fill,
                                      );
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "DAFTAR GAME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: MainBgColor,
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("game").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: snapshot.data!.docs
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Get.to(
                                  () => DetailPage(
                                    id: e.id,
                                    nama_game: e.get("nama_game"),
                                    label_game: e.get("label_game"),
                                    banner: e.get("banner"),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(13),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FutureBuilder(
                                            future: getImageDownloadURL(
                                                e.get("icon_game")),
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
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}

class BodyNavBar extends StatefulWidget {
  const BodyNavBar({Key? key}) : super(key: key);

  @override
  State<BodyNavBar> createState() => _BodyNavBarState();
}

class _BodyNavBarState extends State<BodyNavBar> {
  int _index = 0;

  static final List<Widget> _pages = [
    HomePageComps(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBgColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: DarkPurple,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        selectedItemColor: Red,
        unselectedItemColor: MainBgColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _pages.elementAt(_index),
    );
  }
}
