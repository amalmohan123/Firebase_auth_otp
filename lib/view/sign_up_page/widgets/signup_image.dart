import 'package:flutter/material.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h * 0.33,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/Image/student_fire_new-removebg.png",
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
