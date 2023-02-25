import 'package:flutter/material.dart';
import 'package:google_map/utils/dimension.dart';
import '../../utils/big_text.dart';
import '../../utils/small_text.dart';
import '../../widget/button.dart';
import 'info_2.dart';
import '../registeration/login_screen.dart';

class Info_1 extends StatelessWidget {
  const Info_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: dimension.height45 * 5,
                width: dimension.width30 * 7,
                margin: EdgeInsets.only(top: dimension.height45 * 3),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(dimension.width30 * 5),
                    image:
                        DecorationImage(image: AssetImage("assets/Info_1.png"))),
              ),
              SizedBox(
                height: dimension.height30,
              ),
              Container(
                width: dimension.width30 * 8,
                child: BigText(text: "Get the car to your destination easily"),
              ),
              SizedBox(
                height: dimension.height30,
              ),
              Container(
                width: dimension.width30 * 9,
                child: SmallText(
                    text:
                        "Get a car rental very quickly and easily through online"),
              ),
              SizedBox(
                height: dimension.height45*3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Button(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }, text: "Skip", width: dimension.width30*3.5, textColor: Colors.black, color: Colors.white,)
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                    child: Button(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_2()));
                    }, iconData: Icon(Icons.keyboard_arrow_right, color: Colors.white), width: dimension.width30*2,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
