import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    required this.banner,
    Key? key,
  }) : super(key: key);

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banner.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.asset(banner[index]);
        },
      ),
    );
  }
}
