import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/widgets/fields/custom_bottombar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgot = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool isloading = false.obs;
  Future signup() async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Get.to(() => CustomBottombar());
      } catch (e) {
        Get.snackbar('error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  Future signin() async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Get.to(CustomBottombar());
      } catch (e) {
        Get.snackbar('error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }
}
