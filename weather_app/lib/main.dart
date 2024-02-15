import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/splash_view.dart';

import 'global/materialcolor.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.7, 781.1),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: weatherColor(
                      context.read<WeatherCubit>().weatherModel?.condition),
                ),
                debugShowCheckedModeBanner: false,
                home: const SplashView(),
              );
            },
          );
        },
      ),
    );
  }
}
