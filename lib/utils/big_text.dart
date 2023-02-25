import 'package:flutter/material.dart';
import 'package:google_map/utils/dimension.dart';
class BigText extends StatelessWidget {
  String text;
  Color? color;
  double size;
  TextAlign? textAlign;
  TextOverflow overflow;
  BigText({Key? key, required this.text, this.size=0, this.overflow=TextOverflow.visible, this.color, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign==null?TextAlign.center:textAlign,
      overflow: overflow==TextOverflow.visible?TextOverflow.visible:overflow,
      style: TextStyle(fontSize: size==0?dimension.font26:size,fontFamily: 'Nunito', color: color==null?Colors.black:color),
    );
  }
}
