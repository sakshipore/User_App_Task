import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String prefixIcon;
  final String text;
  Function(String)? onChanged;
  // String suffixIcon;
  TextEditingController controller = TextEditingController();
  InputField(
      {super.key,
      required this.prefixIcon,
      required this.text,
      required this.controller,
      this.onChanged,
      // this.suffixIcon = ""
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          prefixIcon,
          height: 20.h,
          width: 20.w,
        ),
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 20.sp,
          color: Colors.grey,
        ),
        // suffixIcon: Image.asset(
        //   suffixIcon,
        //   height: 20.h,
        //   width: 20.w,
        // ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter " + text;
        }
        return null;
      },
    );
  }
}
