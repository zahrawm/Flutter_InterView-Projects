import 'package:flutter/material.dart';
import 'package:form_app/helper/sized_box_helper.dart';
import 'package:form_app/screen/home_screen.dart';

import 'package:form_app/widgets/custom_button.dart';
import 'package:form_app/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = "/ForgetPasswordScreen";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Enter your email to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Enter your email ",
              labelText: "Email",
              prefixIconData: Icons.email,
              validator: (String? value) {
                if (value!.isEmpty || value.length < 8) {
                  return "Please enter a value";
                } else {
                  return null;
                }
              },
            ),
            SizedBoxHelper.sizedBox20,
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                title: "Forget Password"),
          ],
        ),
      ),
    );
  }
}
