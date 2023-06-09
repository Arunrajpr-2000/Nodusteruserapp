import 'package:flutter/material.dart';
import 'package:noduster/const/cleaningstring.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/cleaningscreen/widget/pricewidget.dart';

class CleaningScreen extends StatelessWidget {
  const CleaningScreen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.fill,
                  ),
                ),
                child: null),
            Positioned(
              bottom: 5,
              left: 10,
              child: Column(
                children: [
                  Text(
                    Cleaning.name['imageheading'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Text(
                    Cleaning.name['imagesubheading'],
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ],
              ),
            )
          ]),
          ChoosePriceWidget(name: name),
          kheight10,
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -',
//                 textAlign: TextAlign.center,
//                 overflow: TextOverflow.clip,
//                 maxLines: 1,
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             ChoosePriceWidget(),
//             kheight10,
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Divider(
//                 thickness: 0.5,
//                 color: Colors.grey,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'You might also clean',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//               ),
//             ),
//             kheight20,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 children: [
//                   Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                               "asset/pexels-mark-mccammon-2724748.jpg"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       height: 90,
//                       width: 90,
//                       child: null),
//                   kheight10,
//                   const Text(
//                     'Refrigerator \nCleaning',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
        ])));
  }
}
