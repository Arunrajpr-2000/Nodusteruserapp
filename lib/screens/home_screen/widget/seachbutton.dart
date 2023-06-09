import 'package:flutter/material.dart';

class Searchbutton extends StatelessWidget {
  const Searchbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration: InputDecoration(
              label: const Text('Search for ....'),
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
    );
  }
}
