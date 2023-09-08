import 'package:fire_auth_otp/view/homepage/homepage.dart';
import 'package:fire_auth_otp/view/profile_page/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'view/loginpage/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
 routes: {
  '/':(context) => Loginpage(),
  '/Homepage':(context) => const Homepage(),
  '/Loginpage':(context) => Loginpage(),
  '/ProfilePage':(context) => const ProfilePage()
 },
    );
  }
}
