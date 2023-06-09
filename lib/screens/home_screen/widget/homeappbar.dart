import 'package:flutter/material.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff537fe7),
      centerTitle: true,
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      title: Image.asset(
        'lib/asset/Homescreen/appbarimage.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
