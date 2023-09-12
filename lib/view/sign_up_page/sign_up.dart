import 'package:fire_auth_otp/controller/firebase_provider.dart';
import 'package:fire_auth_otp/service/firebase_auth_methodes.dart';
import 'package:fire_auth_otp/utils/show_snackbar.dart';
import 'package:fire_auth_otp/view/sign_up_page/widgets/signup_email.dart';
import 'package:fire_auth_otp/view/sign_up_page/widgets/signup_image.dart';
import 'package:fire_auth_otp/view/sign_up_page/widgets/signup_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthMethods _auth = FirebaseAuthMethods(FirebaseAuth.instance);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      String email = emailController.text;
      String password = passwordController.text;

      User? user =
          await _auth.singUpWithEmailAndpassword(email, password, context);

      if (user != null) {
        showSnackbar(context, 'User is Successfully created');

        Navigator.pushNamed(context, "/Homepage");
      }
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: ConstColors.loginBackgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    SignUpImage(w: w, h: h),
                    const SizedBox(height: 60),
                    SignUpEmail(emailController: emailController),
                    const SizedBox(height: 30),
                    SignUpPassword(passwordController: passwordController),
                    const SizedBox(height: 36),
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
                          signUp();
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: ConstColors.loginPageText,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Have an account?",
                        style: const TextStyle(
                            color: ConstColors.blackColor, fontSize: 15),
                        children: [
                          TextSpan(
                            text: '  Go back',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ConstColors.blackColor,
                                fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sign up using on the following methods.',
                      style: TextStyle(
                        color: ConstColors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool? issuccess = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .signInWithGoogle(context);
                        // await FirebaseAuthMethods(FirebaseAuth.instance)
                        //     .signInWithGoogle(context);
                        if (issuccess ?? false) {
                          Navigator.pushNamed(context, "/ProfilePage");
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/Image/g.webp"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
