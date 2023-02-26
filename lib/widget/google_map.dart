import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/widget/button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/small_text.dart';

class SearchLocation extends StatefulWidget {
  SearchLocation({Key? key}) : super(key: key);

  @override
  State createState() => SearchLocationState();
}

class SearchLocationState extends State<SearchLocation> {

  static const LatLng destination = LatLng(37.33500926, -122.03272188);
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: dimension.screenHeight,
            child: Stack(children: [
              Positioned(
                top: 0,
                child: ClipRRect(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: dimension.screenHeight - dimension.height45 * 2,
                    width: dimension.screenWidth,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(target: destination),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
                    width: dimension.screenWidth,
                    padding: EdgeInsets.only(top: dimension.height30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(dimension.width30),
                            topLeft: Radius.circular(dimension.width30))),
                    child: Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                height: 12,
                                width: 12,
                                margin: EdgeInsets.only(
                                    left: dimension.width20,
                                    right: dimension.width20,
                                    top: dimension.height20),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(500, 110, 60, 188),
                                    borderRadius: BorderRadius.circular(
                                        dimension.height20),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(176, 183, 169, 200),
                                        width: 3)),
                              ),
                              Container(
                                  height: dimension.height45 * 1.55,
                                  child: VerticalDivider(
                                      thickness: 2, color: Colors.grey[300])),
                              Container(
                                height: 12,
                                width: 12,
                                margin: EdgeInsets.only(
                                    left: dimension.width20,
                                    right: dimension.width20),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(
                                        dimension.height20),
                                    border: Border.all(
                                        color: Colors.lightGreen, width: 3)),
                              ),
                            ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: dimension.height20,
                                      bottom: dimension.height10),
                                  child: SmallText(text: "Pick Up"),
                                ),
                                Container(
                                  width: dimension.width30 * 8,
                                  height: dimension.height30,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: dimension.font20,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: "Set Location",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: dimension.height10,
                                  ),
                                  child: SmallText(text: "Drop Off"),
                                ),
                                Container(
                                  width: dimension.width30 * 8,
                                  height: dimension.height45,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: dimension.font20,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: "Set Location",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.all(dimension.height10*0.4),
                                margin: EdgeInsets.only(right: dimension.width30),
                                child: FaIcon(FontAwesomeIcons.arrowsUpDown,color: Colors.grey[600]),
                              ),
                            )
                          ]),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: dimension.width20,
                            vertical: dimension.height10),
                        child: Button(
                          onTap: () {
                          },
                          text: "Continue",
                          width: dimension.screenWidth,
                          height: dimension.height45,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.all(dimension.height20),
                    padding: EdgeInsets.all(dimension.width10*0.3),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(dimension.height30)
                    ),
                    child: Icon(Icons.gps_fixed_rounded),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: Duration(milliseconds: 600),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                    ),);
                  },
                  child: Container(
                    margin: EdgeInsets.all(dimension.height20),
                    padding: EdgeInsets.all(dimension.width10*0.3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(dimension.height30)
                    ),
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
