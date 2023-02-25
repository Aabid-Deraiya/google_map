import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocode/geocode.dart';
import 'package:google_map/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map/ui/registeration/login_screen.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/closs_app.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_map/utils/toast.dart';
import 'package:google_map/widget/bottom_bar.dart';
import 'package:google_map/widget/button.dart';
import '../../widget/car_card.dart';
import '../../widget/google_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final closeApp = CloseApp();
  final auth = FirebaseAuth.instance;
  var search=TextEditingController();
  static const LatLng sourceLocation=LatLng(21.202805807943673, 72.80588527100238);
  List<String> items = [
    'assets/car_1.png',
    'assets/car_2.png',
    'assets/car_3.png',
    'assets/car_4.png',
    'assets/car_5.png'
  ];
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => closeApp.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: dimension.width20,
                              vertical: dimension.height20),
                          child: BigText(
                            text: greeting(),
                            color: Color.fromARGB(500, 110, 60, 188),
                          ),
                        ),
                        Container(
                          width: dimension.width30 * 6.5,
                          margin:
                              EdgeInsets.symmetric(horizontal: dimension.width20),
                          child: BigText(
                            text: "What do you want to experience today?",
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                        width: dimension.width30 * 1.5,
                        height: dimension.height30 * 1.5,
                        margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dimension.width30),
                            image: DecorationImage(
                                image: AssetImage("assets/Logo.png"))),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: dimension.height20,
                      right: dimension.height20,
                      top: dimension.height20),
                  child: TextFormField(
                    showCursor: true,
                    readOnly: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchLocation()));
                    },
                    onChanged: (value){
                    },
                    controller: search,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.black, fontSize: dimension.font16 * 1.2),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.filter_list),
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search Location",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(dimension.width10)),
                    ),
                  ),
                ),
                Container(
                    width: dimension.screenWidth,
                    height: dimension.height45 * 4.5,
                    margin: EdgeInsets.only(bottom: dimension.width20, top: dimension.width20),
                    child:CarouselSlider(
                        items: items
                            .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(
                              dimension.width10 * 2),
                          child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ))
                            .toList(),
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )
                    )
                    // GoogleMap(initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 14.5))
                ),
                Button(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchLocation()));
                  },
                  text: "Book a car",
                  width: dimension.width30 * 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: dimension.width20,
                      vertical: dimension.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Promotion"),
                      SmallText(text: "See All"),
                    ],
                  ),
                ),
                CarCard(),
                IconButton(onPressed: (){
                  auth.signOut().then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }).onError((error, stackTrace) {
                    authToast(Colors.red).toastMessage(error.toString());
                  });
                }, icon: Icon(Icons.logout)),
              ],
            ),
          ),
          extendBody: true,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(dimension.width30), topLeft: Radius.circular(dimension.width30))
            ),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }
  // void _sendDataToSecondScreen(BuildContext context, String textToSend) {
  //   textToSend = search.text;
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => SearchLocation(value: search.text,),
  //       ));
  // }
}
