import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_model.dart';

import '../cubits/weather_cubit/weather_cubit.dart';
import '../global/materialcolor.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weathermodel = context.read<WeatherCubit>().weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherColor(weathermodel!.condition),
          weatherColor(weathermodel.condition)[300]!,
          weatherColor(weathermodel.condition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
            Text(
              "updated at: ${weathermodel.date.hour}:${weathermodel.date.minute}",
              style: TextStyle(
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 32.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weathermodel.img}",
                ),
                Text(
                  weathermodel.temp.round().toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp: ${weathermodel.maxTemp.round().toString()}",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "MinTemp: ${weathermodel.minTemp.round().toString()}",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              weathermodel.condition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
