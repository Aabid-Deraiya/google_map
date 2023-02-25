import 'package:flutter/material.dart';
import 'package:google_map/utils/dimension.dart';
class SmallText extends StatelessWidget {
  String text;
  double size;
  Color? color;
  TextOverflow overflow;
  TextAlign alignment;
  SmallText({Key? key, required this.text, this.size=0, this.overflow=TextOverflow.visible, this.color=Colors.grey, this.alignment=TextAlign.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      overflow: overflow==TextOverflow.visible?TextOverflow.visible:overflow,
      style: TextStyle(fontSize: size==0?dimension.font16:size, fontFamily: 'Nunito-Bold', color: color==Colors.grey?Colors.grey[500]:color)
    );
  }
}
