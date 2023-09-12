import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';

class SignInUsername extends StatelessWidget {
  const SignInUsername({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.loginBackgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            spreadRadius: 7,
            blurRadius: 8,
            offset: const Offset(1, 1),
            color: const Color.fromARGB(255, 114, 193, 174)
                .withOpacity(.8),
          )
        ],
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: TextStyle(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: ConstColors.loginBackgroundColor,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

