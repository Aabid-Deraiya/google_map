import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Color.fromARGB(500, 110, 60, 188),
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.add_chart, size: 30),
        Icon(Icons.chat_rounded, size: 30),
        Icon(Icons.person, size: 30),
      ],
      onTap: (index) {

      },
    );
  }
}
