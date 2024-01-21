import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_app/firebase_options.dart';
import 'package:form_app/screen/authentication_screen.dart';
import 'package:form_app/screen/forget_password_screen.dart';
import 'package:form_app/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2))),
      ),
      initialRoute: AuthenticationScreen.routeName,
      routes: {
        AuthenticationScreen.routeName: (context) =>
            const AuthenticationScreen(),
        ForgetPasswordScreen.routeName: (context) =>
            const ForgetPasswordScreen(),
        HomeScreen.routeName: (context) => const HomeScreen()
      },
      home: HomeScreen(),
    );
  }
}
