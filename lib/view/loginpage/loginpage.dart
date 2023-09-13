import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fire_auth_otp/controller/firebase_provider.dart';
import 'package:fire_auth_otp/helpers/colors.dart';
import 'package:fire_auth_otp/service/firebase_auth_methodes.dart';
import 'package:fire_auth_otp/utils/show_snackbar.dart';
import 'package:fire_auth_otp/view/loginpage/widgets/signin_password.dart';
import 'package:fire_auth_otp/view/loginpage/widgets/signin_username.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../sign_up_page/sign_up.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;

      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      }
    });
  }

  showDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("No Connection"),
        content: const Text("Please check your internet connectivity"),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() {
                isAlertSet = false;
              });
              isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected) {
                showDialogBox();
                setState(() {
                  isAlertSet = true;
                });
              }
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  final FirebaseAuthMethods _auth = FirebaseAuthMethods(FirebaseAuth.instance);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: ConstColors.loginBackgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: GoogleFonts.acme(
                                fontSize: 60,
                                color: const Color.fromARGB(255, 39, 0, 122),
                              ),
                            ),
                            Text(
                              "Welcome",
                              style: GoogleFonts.acme(
                                fontSize: 60,
                                color: ConstColors.loginPageText,
                              ),
                            ),
                            Text(
                              "Sign into your account",
                              style: GoogleFonts.acme(
                                  fontSize: 20,
                                  color: ConstColors.loginPageText,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SignInUsername(emailController: emailController),
                    const SizedBox(height: 30),
                    SignInpasswod(passwordController: passwordController),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        const Text(
                          'Forgot your Password?',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 9, 231, 205),
                            Color.fromARGB(255, 53, 226, 228),
                            Color.fromARGB(255, 4, 250, 188),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 50),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          signIn();
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: ConstColors.loginPageText,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 77, 100, 105),
                            fontSize: 18),
                        children: [
                          TextSpan(
                            text: ' Create',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ConstColors.blackColor,
                                fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user =
        await _auth.singInWithEmailAndpassword(email, password, context);

    if (user != null) {
      showSnackbar(context, 'User is Successfully SignIn');

      Navigator.pushNamed(context, "/Homepage");
    }
  }
}
