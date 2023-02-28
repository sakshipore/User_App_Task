import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signUpUser(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update user display name
      await userCredential.user?.updateDisplayName(name);

      // Update user phone number
      // await userCredential.user?.updatePhoneNumber(
      //   PhoneAuthCredential(
      //     phoneVerificationCompleted: (phoneAuthCredential) {},
      //     phoneVerificationFailed: (verificationFailed) {},
      //     verificationCompleted: (phoneAuthCredential) {},
      //     verificationFailed: (verificationFailed) {},
      //     codeSent: (verificationId, resendToken) {},
      //     codeAutoRetrievalTimeout: (verificationId) {},
      //   ),
      // );

      // Save user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User ID: ${userCredential.user?.uid}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
}
}
