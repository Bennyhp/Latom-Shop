import 'package:flutter/material.dart';
import 'misc/color.dart';
import 'misc/user.dart';
import 'misc/userpreference.dart';
import 'widgets/appbarwidget.dart';
import 'widgets/buttonwidget.dart';
import 'widgets/profilewidget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          Center(child: buildHistory()),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit Password',
        onClicked: () {},
      );

  Widget buildHistory() => Container(
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
                primary: Red,
              ),
            ),
          ],
        ),
      );
}
