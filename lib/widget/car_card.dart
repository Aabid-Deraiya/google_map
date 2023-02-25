import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';

class CarCard extends StatefulWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  State<CarCard> createState() => _CarCardState();
}

class card {
  String img;
  String title;
  String subTitle;

  card(this.img, this.title, this.subTitle);
}

class _CarCardState extends State<CarCard> {
  List<card> items = [
    card("assets/card/innova.png", "50% Discount", "on all car rentals"),
    card("assets/card/mahindra.png", "20% Discount", "on all car rentals"),
    card("assets/card/sedan.png", "10% Discount", "on all car rentals"),
    card("assets/card/bmw.png", "70% Discount", "on all car rentals")
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: dimension.screenHeight/8),
      items: items
          .asMap()
          .map(
            (i, elem) => MapEntry(
              i,
              Stack(
                children: [
                  Container(
                    width: dimension.screenWidth,
                    margin: EdgeInsets.symmetric(horizontal: dimension.width10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(50, 110, 60, 188),
                        borderRadius:
                            BorderRadius.circular(dimension.width10 * 1.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: dimension.screenHeight/4,
                          width: dimension.screenWidth/4,
                          margin: EdgeInsets.symmetric(
                              horizontal: dimension.width20),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(elem.img)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: dimension.width10*0.5),
                              child: BigText(
                                  text: elem.title,
                                  size: dimension.font20 * 1.20, color: Color.fromARGB(500, 110, 60, 188),),
                            ),
                            Container(
                              child: SmallText(text: elem.subTitle, color: Color.fromARGB(500, 110, 60, 188), size: dimension.font20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
