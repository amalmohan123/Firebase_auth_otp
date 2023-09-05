import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/show_snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

// Email sign up

  Future<void> singUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch (e){
      
      showSnackbar(context,e.message!);

    }
  }
}
