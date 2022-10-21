import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final context2;

  const PopupMenu({super.key, this.context2});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        // add icon, by default "3 dot" icon
        // icon: Icon(Icons.book)
        itemBuilder: (context2) {
      return [
        PopupMenuItem<int>(
          value: 0,
          child: Text("My Account"),
        ),
      ];
    }, onSelected: (value) {
      if (value == 0) {
        print("My account menu is selected.");
      }
    });
  }
}
