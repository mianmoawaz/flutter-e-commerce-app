import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/constant/app_images.dart';
import 'package:flutter_e_commece_app/controller/auth_controller.dart';
import 'package:flutter_e_commece_app/view/auth/signup.dart';
import 'package:flutter_e_commece_app/widgets/button/common_button.dart';
import 'package:flutter_e_commece_app/widgets/fields/comon_textfields.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: authController.formkey,
            child: Column(
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
                const SizedBox(height: 30),
                const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 60),
                CommonTextField(
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    controller: authController.email,
                    hintText: 'Email',
                    icon: Icons.email),
                const SizedBox(height: 20),
                CommonTextField(
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    controller: authController.password,
                    hintText: 'Password',
                    icon: Icons.lock),
                const SizedBox(height: 50),
                Text(
                  'Forgot password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 50),
                ComonButton(
                  title: 'Sign in',
                  onTap: () => authController.signin(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Signup());
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
