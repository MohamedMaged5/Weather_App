import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 28.sp,
              ),
            ),
          ),
          Center(
            child: Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 28.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
