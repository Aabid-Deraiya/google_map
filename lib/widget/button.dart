import 'package:flutter/material.dart';
import 'package:google_map/utils/dimension.dart';

class Button extends StatelessWidget {
  String? text;
  double height;
  double width;
  double size;
  bool loading;
  Icon iconData;
  VoidCallback onTap;
  Color color;
  Color textColor;
  Button({Key? key, this.text, required this.onTap, this.color=Colors.purple, this.iconData = const Icon(Icons.ac_unit), this.height=0, this.width=0, this.size=0, this.textColor=Colors.white, this.loading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height==0?dimension.height45:height,
        width: width==0?dimension.screenWidth:width,
        decoration: BoxDecoration(
          color: color==Colors.purple?Color.fromARGB(500, 110, 60, 188):color,
          borderRadius: BorderRadius.circular(dimension.width10*1.3)
        ),
        child: loading?CircularProgressIndicator(strokeWidth: 3, color: Colors.white,):text == null ? iconData==Icon(Icons.abc_outlined)?Icon(Icons.abc_outlined):iconData : Text(text!, style: TextStyle(fontFamily: 'Nunito',color: textColor==null?Colors.white:textColor, fontSize: size==0?dimension.font20:size),textAlign: TextAlign.center,)
      ),
    );
  }
}
