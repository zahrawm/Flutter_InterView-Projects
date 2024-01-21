import 'package:flutter/material.dart';
import 'package:form_app/helper/sized_box_helper.dart';
import 'package:form_app/provider/auth_provider.dart';
import 'package:form_app/screen/forget_password_screen.dart';

import 'package:form_app/widgets/custom_button.dart';
import 'package:form_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  static String routeName = "/AuthenticationScreen";
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, provider, _) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _key,
                child: ListView(
                  children: [
                    if (!provider.isLogin)
                      CustomTextField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter a username";
                            } else {
                              return null;
                            }
                          },
                          controller: usernameController,
                          hintText: "Enter your Username",
                          labelText: "Username",
                          prefixIconData: Icons.person),
                    SizedBoxHelper.sizedBox20,
                    CustomTextField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter  a valid email";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        hintText: "Enter your Email",
                        labelText: "Email",
                        prefixIconData: Icons.email),
                    SizedBoxHelper.sizedBox20,
                    CustomTextField(
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 8) {
                            return "Please enter your password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: provider.obscureText,
                        controller: passwordController,
                        hintText: "Enter your Password",
                        labelText: "Password",
                        prefixIconData: Icons.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.setobscureText();
                          },
                          icon: Icon(provider.obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                        )),
                    SizedBoxHelper.sizedBox20,
                    if (!provider.isLogin)
                      CustomTextField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter a value";
                            } else if (value != passwordController.text) {
                              return "Password does not match";
                            } else {
                              return null;
                            }
                          },
                          obscureText: provider.obscureText,
                          controller: confirmedPasswordController,
                          hintText: "Enter your Password",
                          labelText: "Confirmed Password",
                          prefixIconData: Icons.password,
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.setobscureText();
                            },
                            icon: Icon(provider.obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off),
                          )),
                    SizedBoxHelper.sizedBox20,
                    CustomTextField(
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Please enter your phone number";
                        } else {
                          return null;
                        }
                      },
                      controller: phonenumberController,
                      hintText: "Enter your Phone Number",
                      labelText: "Phone Number",
                      prefixIconData: Icons.phone,
                    ),
                    SizedBoxHelper.sizedBox20,
                    CustomButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            if (provider.isLogin) {
                              provider.signIn(
                                  email: emailController.text,
                                  password: passwordController.text);
                            } else {
                              provider.signUp(
                                  email: emailController.text,
                                  password: passwordController.text);
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.routeName);
                            }
                          }
                        },
                        title: "Register"),
                    MaterialButton(
                        onPressed: () {
                          provider.setIsLogin();
                        },
                        child: Text(provider.isLogin
                            ? "Don't have an account? Register"
                            : "Already have an aaccount ? Login")),
                    MaterialButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgetPasswordScreen.routeName);
                        },
                        child: const Text("Forget Password"))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
