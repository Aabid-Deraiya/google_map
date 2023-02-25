import 'package:flutter/material.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  GoogleMapController? myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      borderRadius: BorderRadius.circular(dimension.height20),
                      border: Border.all(
                          color: Color.fromARGB(176, 183, 169, 200), width: 3)),
                ),
                Container(
                    height: dimension.height45 * 3,
                    child:
                        VerticalDivider(thickness: 2, color: Colors.grey[300])),
                Container(
                  height: 12,
                  width: 12,
                  margin: EdgeInsets.only(
                      left: dimension.width20, right: dimension.width20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(dimension.height20),
                      border: Border.all(color: Colors.lightGreen, width: 3)),
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: dimension.height20, bottom: dimension.height10),
                    child:SmallText(text: "Pick Up"),
                  ),
                  Container(
                    width: dimension.width30*8,
                    height: dimension.height30,
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: dimension.font20,
                      ),
                      decoration: InputDecoration(
                        hintText: "Set Location",
                        enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              color: Colors.grey),
                        ),
                        disabledBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: dimension.height20, bottom: dimension.height10),
                    child:SmallText(text: "Pick Up"),
                  ),
                  Container(
                    width: dimension.width30*8,
                    height: dimension.height45*2,
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: dimension.font20,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 3, color: Colors.greenAccent),
                        ),
                        disabledBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 3, color: Colors.greenAccent),
                        ),
                        focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 3, color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
            SizedBox(
              height: dimension.height45*5,
            ),
        Container(
          height: dimension.height45*6,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 10.0,
            ),
          ),
        )
        ]
      )
      ),
    );
  }
}
