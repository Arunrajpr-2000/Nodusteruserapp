import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/homescreenstring.dart';
import 'package:noduster/screens/cleaningscreen/cleaningwidget.dart';
import 'package:noduster/screens/home_screen/widget/banners.dart';
import 'package:noduster/screens/home_screen/widget/homeappbar.dart';
import 'package:noduster/screens/home_screen/widget/seachbutton.dart';
import 'package:noduster/screens/home_screen/widget/washingicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: Homeappbar()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Searchbutton(),
            PageViewWidget(
              banner: Homescreenstrings.homescreenbanner,
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Washing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Washingicons(
                    washingimage: Homescreenstrings.washing[index]['image'],
                    washingname: Homescreenstrings.washing[index]['Washing']),
                itemCount: Homescreenstrings.washing.length,
              ),
            ),
            kheight20,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Cleaning',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 5),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => CleaningScreen(
                        name: Homescreenstrings.cleaning[index]['name']));
                    log(Homescreenstrings.cleaning[index]['name']);
                  },
                  child: Washingicons(
                      washingimage: Homescreenstrings.cleaning[index]['image'],
                      washingname: Homescreenstrings.cleaning[index]['name']),
                ),
                itemCount: Homescreenstrings.cleaning.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Service',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Washingicons(
                    washingimage: Homescreenstrings.service[index]['image'],
                    washingname: Homescreenstrings.service[index]['name']),
                itemCount: Homescreenstrings.service.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Catch your deal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                kheight10,
                Image.asset(Homescreenstrings.dealsimage[0]),
                kheight10,
                Image.asset(Homescreenstrings.dealsimage[1]),
                kheight10,
                Image.asset(Homescreenstrings.dealsimage[2])
              ]),
            )
          ],
        ),
      ),
    );
  }
}
