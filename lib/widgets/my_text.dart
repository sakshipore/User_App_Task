import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  final String text;
  final double textSize;
  FontWeight textWeight;
  MyText({super.key, required this.text, required this.textSize, this.textWeight=FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize.sp,
        color: Colors.grey,
        fontWeight: textWeight,
      ),
    );
  }
}
