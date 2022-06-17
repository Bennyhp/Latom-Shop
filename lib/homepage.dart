import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'codmpage.dart';
import 'ffpage.dart';
import 'mlpage.dart';
import 'profilepage.dart';
import 'misc/color.dart';
import 'pubgmpage.dart';

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
      backgroundColor: MainBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 200,
                child: PageView(
                  pageSnapping: true,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/promos/promo1.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/promos/promo2.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/promos/promo3.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/promos/promo4.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "TOP UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Red,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MLPage(),
                          )),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/games/ml.png")),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FFPage(),
                          )),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/games/ff.png")),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CODMPage(),
                          )),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/games/codm.png")),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PUBGMPage(),
                          )),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/games/pubgm.png"),
                        ),
                      ),
                    ),
                  ],
                ),
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
