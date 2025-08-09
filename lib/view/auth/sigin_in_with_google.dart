import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/constant/app_images.dart';
import 'package:flutter_e_commece_app/view/auth/signup.dart';
import 'package:flutter_e_commece_app/widgets/button/common_button.dart';
import 'package:get/get.dart';

class SiginInWithGoogle extends StatefulWidget {
  const SiginInWithGoogle({super.key});

  @override
  State<SiginInWithGoogle> createState() => _SiginInWithGoogleState();
}

class _SiginInWithGoogleState extends State<SiginInWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                AppImages.image4,
                height: 150,
              ),
            ),
          ),
          Text(
            'Let’s You in',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.image5,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                Container(
                  height: 3,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 3,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ComonButton(
              title: 'sign with google',
              onTap: () {
                Get.to(Signup());
              })
        ],
      ),
    );
  }
}
