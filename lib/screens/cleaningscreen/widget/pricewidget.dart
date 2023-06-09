import 'package:flutter/material.dart';
import 'package:noduster/const/cleaningstring.dart';
import 'package:noduster/const/const.dart';

class ChoosePriceWidget extends StatelessWidget {
  const ChoosePriceWidget({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Text(Cleaning.name[0]['mainheading'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  textAlign: TextAlign.left),
              kheight10,
              Text(Cleaning.name[0]['subheadingone'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15),
                  textAlign: TextAlign.left),
              kheight20,
              Text('₹${Cleaning.name[0]['price']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  textAlign: TextAlign.left),
            ],
          ),
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(Cleaning.name[0]['cartimage']),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 90,
                width: 90,
                child: null),
            Positioned(
                bottom: 0,
                top: 65,
                right: 10,
                left: 10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.blue),
                  ),
                ))
          ]),
          kheight20,
        ],
      ),
    );
  }
}
