import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/constant/app_images.dart';
import 'package:flutter_e_commece_app/controller/auth_controller.dart';
import 'package:flutter_e_commece_app/view/auth/signin.dart';
import 'package:flutter_e_commece_app/widgets/button/common_button.dart';
import 'package:flutter_e_commece_app/widgets/fields/comon_textfields.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  'Create your account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 60),
                CommonTextField(
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: authController.name,
                  hintText: 'Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: authController.email,
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: authController.password,
                  hintText: 'Password',
                  icon: Icons.lock,
                ),
                const SizedBox(height: 50),
                ComonButton(
                  title: 'Signup',
                  onTap: () => authController.signup(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Signin());
                      },
                      child: const Text(
                        'Sign In',
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
