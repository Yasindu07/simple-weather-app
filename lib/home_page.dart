// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, empty_constructor_bodies, unused_local_variable, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weatherData.dart';

var dateInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dateInfo);

class HomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    // var Gposition = await GetPosition();
    data = await client.getData('51.52', '-0.11');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.77,
                  width: size.width,
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 147, 51, 243),
                        Color.fromARGB(255, 0, 144, 228),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${data?.cityName}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 35,
                            fontFamily: 'MavenPro'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        dateFormat,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                            fontFamily: 'MavenPro'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Image.asset(
                      //   'assets/img/sun.png',
                      //   width: size.width * 0.3,
                      // ),
                      Image.network(
                        'https:${data?.icon}',
                        width: size.width * 0.35,
                        fit: BoxFit.fill,
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        '${data?.condition}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Hubballi'),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        '${data?.temp}°',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Hubballi'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/windspeed.png',
                                  width: size.width * 0.13,
                                ),
                                Text(
                                  '${data?.wind} km/h',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Hubballi',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/humidity.png',
                                  width: size.width * 0.13,
                                ),
                                Text(
                                  '${data?.humidity}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Hubballi',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/winddirection.png',
                                  width: size.width * 0.25,
                                ),
                                Text(
                                  '${data?.wind_dir}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Hubballi',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Wind Direction',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Gust',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.gust} kp/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubballi',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Pressure',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.pressure} hpa',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubballi',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'UV',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.uv}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubballi',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Precipitation',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.pricipe} mm',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubballi',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Wind',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.wind} km/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubballi',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Last Update',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${data?.last_update}',
                            style: TextStyle(
                              color: Colors.green.withOpacity(0.9),
                              fontFamily: 'Hubballi',
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
