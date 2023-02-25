import 'package:flutter/material.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/small_text.dart';

class SearchLocation extends StatefulWidget {
  SearchLocation({Key? key}) : super(key: key);

  @override
  State createState() => SearchLocationState();
}

class SearchLocationState extends State<SearchLocation> {
  static const LatLng sourceLocation =
      LatLng(21.202805807943673, 72.80588527100238);
  static const LatLng destination = LatLng(37.33500926, -122.03272188);
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  height: dimension.screenHeight,
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(dimension.width30),
                          topRight: Radius.circular(dimension.width30)),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        height: dimension.height45 * 9,
                        width: dimension.screenWidth,
                        child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: sourceLocation, zoom: 14.5)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Column(children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(
                                  left: dimension.width20,
                                  right: dimension.width20,
                                  top: dimension.height20
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(500, 110, 60, 188),
                                  borderRadius:
                                  BorderRadius.circular(dimension.height20),
                                  border: Border.all(
                                      color: Color.fromARGB(176, 183, 169, 200),
                                      width: 3
                                  )
                              ),
                            ),
                            Container(
                                height: dimension.height45 * 3,
                                child: VerticalDivider(
                                    thickness: 2, color: Colors.grey[300])),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(
                                  left: dimension.width20, right: dimension.width20),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                  BorderRadius.circular(dimension.height20),
                                  border:
                                  Border.all(color: Colors.lightGreen, width: 3)),
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
                                  decoration: InputDecoration(
                                    hintText: "Set Location",
                                    enabledBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: dimension.height20,
                                    bottom: dimension.height10),
                                child: SmallText(text: "Pick Up"),
                              ),
                              Container(
                                width: dimension.width30 * 8,
                                height: dimension.height45 * 2,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: dimension.font20,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.greenAccent),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.greenAccent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.greenAccent),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ]),
                    ),
                  ]),
                ),

              ],
            )),
      ),
    );
  }
}
