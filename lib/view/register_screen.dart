import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app_task/controller/auth_controller.dart';
import 'package:user_app_task/widgets/button.dart';
import 'package:user_app_task/widgets/input_field.dart';
import 'package:user_app_task/widgets/my_text.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Register in to get started",
                    textSize: 18,
                    textWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MyText(
                    text: "Experience the all new App!",
                    textSize: 14,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputField(
                    prefixIcon: "assets/user/person-24px (1).png",
                    text: "Name",
                    controller: controller.nameController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputField(
                    prefixIcon: "assets/user/email-24px.png",
                    text: "Email ID",
                    controller: controller.emailController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputField(
                    prefixIcon: "assets/user/phone-24px.png",
                    text: "Mobile No",
                    controller: controller.mobileNoController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputField(
                    prefixIcon: "assets/user/Icon ionic-ios-lock.png",
                    text: "Password",
                    controller: controller.passwordController,
                    // suffixIcon: "assets/user/Icon awesome-eye.png",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputField(
                    prefixIcon: "assets/user/Icon ionic-ios-lock.png",
                    text: "Confirm Password",
                    controller: controller.confirmPasswordController,
                    // suffixIcon: "assets/user/Icon awesome-eye.png",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  MyButton(
                    onTap: () async {
                      await controller.signUpUser(
                          controller.nameController.toString(),
                          controller.emailController.toString(),
                          controller.mobileNoController.toString(),
                          controller.passwordController.toString());
                    },
                    height: 50.h,
                    width: MediaQuery.of(context).size.width - 20,
                    text: "Register",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
