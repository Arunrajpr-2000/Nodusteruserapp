import 'package:flutter/material.dart';

import 'package:noduster/const/const.dart';

class Washingicons extends StatelessWidget {
  const Washingicons(
      {super.key, required this.washingimage, required this.washingname});
  final String washingname;
  final String washingimage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 110,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage(washingimage)),
              ),
            ),
            kheight10,
            Text(
              washingname,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
