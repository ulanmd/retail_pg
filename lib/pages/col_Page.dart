import 'dart:developer';
import 'dart:io';

import 'package:analog_clock/analog_clock.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/utils/weather_type.dart';
import 'package:retail_pg/consts.dart';
import 'package:retail_pg/evrika_colors.dart';
import 'package:retail_pg/pages/desktop_page.dart';
import 'package:dio/dio.dart';
import 'package:retail_pg/weather.dart';
import 'package:retail_pg/widgets/weather_widget.dart';

class ColPage extends StatelessWidget {
  const ColPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quote = 'lolo';
    Future<String> getHttp() async {
      try {
        var response = await Dio().get(
            'http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=ru');
        quote = response.data['quoteText'].replaceAll(r"\'", "'");
        return quote;
      } catch (e) {
        print(e);
        return 'fucl';
      }
    }

    Future<Weather> getWeather(city) async {
      try {
        var response =
            await Dio().get('https://api.openweathermap.org/data/2.5/'
                'weather?q=${city}'
                '&appid=2743793b4ec897cf15f453af10360092'
                '&units=metric&lang=ru');
        var data = response.data;
        WeatherType? mainType = kWeatherTypes[data['weather'][0]['main'].toLowerCase()];
        if(data['weather'][0]['icon'].contains('n')){
          mainType = kWeatherNTypes[data['weather'][0]['main'].toLowerCase()];
        }

       print('object : $mainType');
        return Weather(
            city: data['name'],
            temp: data['main']['temp'].round(),
            desc: data['weather'][0]['description'].split(" ")[0],
            mainType: mainType!);
      } catch (e) {
        print(e);
        return Weather(
            city: 'city', temp: 0, desc: 'desc', mainType: WeatherType.sunny);
      }
    }


    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg2.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              FutureBuilder<Weather>(
                  future: getWeather('shymkent'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading...');
                    } else if (snapshot.hasData) {
                      print(snapshot.data!.desc);
                      return WeatherWidget(weather: snapshot.data!);
                    } else {
                      return Text('Something went wrong...');
                    }
                  }),
              FutureBuilder<Weather>(
                  future: getWeather('osaka'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading...');
                    } else if (snapshot.hasData) {
                      print(snapshot.data!.desc);
                      return WeatherWidget(weather: snapshot.data!);
                    } else {
                      return Text('Something went wrong...');
                    }
                  }),
              FutureBuilder<Weather>(
                  future: getWeather('seoul'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading...');
                    } else if (snapshot.hasData) {
                      print(snapshot.data!.desc);
                      return WeatherWidget(weather: snapshot.data!);
                    } else {
                      return Text('Something went wrong...');
                    }
                  }),
            ],
          ),
          SizedBox(height: 20,),
          Flexible(
            child: Center(
              child: AnalogClock(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: EvrikaColors.mainOrange),
                   color: EvrikaColors.white.withOpacity(0.4),
                    shape: BoxShape.circle),
                width: 300.0,
                isLive: true,
                minuteHandColor: EvrikaColors.mainOrange,
                hourHandColor: EvrikaColors.mainOrange,
                showSecondHand: true,
                numberColor: EvrikaColors.kPrimaryColor,
                digitalClockColor: EvrikaColors.kPrimaryColor,
                showNumbers: true,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime.now(),
                key: const GlobalObjectKey(3),
              ),
            ),
          ),
          SizedBox(height: 20,),
          FutureBuilder<String>(
              future: getHttp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('loading...');
                } else if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: EvrikaColors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Цитата дня:', style: TextStyle(fontSize: 20),),
                        Flexible(child: Text(snapshot.data!, style: const TextStyle(fontSize: 15),))
                      ],
                    ),
                  );
                } else {
                  return Text('Something went wrong...');
                }
              }),
          SizedBox(height: 20,)
        ]),
      ),
    );
  }
}
