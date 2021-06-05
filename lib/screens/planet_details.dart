import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_ar/model/planet.dart';

import 'augmented_reality.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  const PlanetDetails({Key key, this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * 0.35,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: planet.name,
                    child: Image.asset(
                      planet.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(-100 * value, 150 * value),
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 500),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xFFF7FAFA),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              planet.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${planet.distFromSun}/KM',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            planet.description,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailsInfo(
                                size: size,
                                imgPath: 'assets/svgs/circle.svg',
                                infoTitle: 'Size/Km',
                                infoDetail: '${planet.radius}',
                                color: 0xFFFFFFFF,
                              ),
                              DetailsInfo(
                                size: size,
                                imgPath: 'assets/svgs/water.svg',
                                infoTitle: 'Life',
                                infoDetail: '${planet.life}',
                                color: 0xFFC3E7BC,
                              ),
                              DetailsInfo(
                                size: size,
                                imgPath: 'assets/svgs/sun.svg',
                                infoTitle: 'Day/Hr',
                                infoDetail: '${planet.hours}',
                                color: 0xFFC8E7F2,
                              ),
                              DetailsInfo(
                                size: size,
                                imgPath: 'assets/svgs/moon.svg',
                                infoTitle: 'Moons',
                                infoDetail: '${planet.moons}',
                                color: 0xFFF2F2F2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AR(
                                planet: planet,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/images/AR.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    Key key,
    @required this.size,
    this.imgPath,
    this.infoTitle,
    this.infoDetail,
    this.color,
  }) : super(key: key);

  final Size size;
  final String imgPath;
  final String infoTitle;
  final String infoDetail;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height * 0.18,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgPath,
            width: 50,
            height: 50,
          ),
          Text(
            infoTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Text(
            infoDetail,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
