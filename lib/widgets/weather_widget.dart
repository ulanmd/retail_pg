import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/utils/weather_type.dart';
import 'package:retail_pg/consts.dart';
import 'package:retail_pg/evrika_colors.dart';
import 'package:retail_pg/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: Stack(
          children: [
            WeatherBg(
              weatherType: weather.mainType,
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Positioned(
              bottom: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    color: EvrikaColors.darkColor.withOpacity(0.3)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.city,
                          style: TextStyle(
                            color: EvrikaColors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          weather.desc,
                          style: TextStyle(
                            color: EvrikaColors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Text(
                      '${weather.temp.toString()}°C',
                      style: TextStyle(
                          color: EvrikaColors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
