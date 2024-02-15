import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: TextField(
            onSubmitted: (value) {
              context.read<WeatherCubit>().getWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                hintText: "Enter city name",
                labelText: "Search",
                suffixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                ))),
          ),
        ),
      ),
    );
  }
}
