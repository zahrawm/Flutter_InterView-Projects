import 'package:flutter/material.dart';
import 'package:form_app/screen/authentication_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AuthenticationScreen.routeName);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
