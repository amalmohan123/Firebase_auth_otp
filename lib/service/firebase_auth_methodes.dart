import 'package:fire_auth_otp/utils/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuthMethods(FirebaseAuth instance);

  // SignUp

  Future<User?> singUpWithEmailAndpassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
    return null;
  }

  //SignIn

  Future<User?> singInWithEmailAndpassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
    return null;
  }

  // Google SignUp

  Future<bool?> signInWithGoogle(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user != null ? true : false;
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
      return false;
    }
  }
}


























































// //   Future<void> signInWithGoogle(BuildContext context) async {
// //     try {
// //       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

// //       final GoogleSignInAuthentication? googleAuth =
// //           await googleUser?.authentication;

// //       if (googleAuth?.accessToken != null && googleAuth?.idToken != null)
// //         final Credential = GoogleAuthProvider.credential(
// //           accessToken: googleAuth?.accessToken,
// //           idToken: googleAuth?.idToken,
// //         );
// // UserCredential userCredential = await _auth.signInWithCredential(credential);

// //     } on FirebaseAuthException catch (e) {
// //       showSnackbar(context, e.message!);
// //     }
// //   }

// // import 'package:fire_auth_otp/utils/show_snackbar.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/cupertino.dart';

// // class FirebaseAuthMethods {
// //   final FirebaseAuth _auth;
// //   FirebaseAuthMethods(this._auth);

// //   Future<void> signUpWithEmail({
// //     required String email,
// //     required String password,
// //     required BuildContext context,
// //   }) async {
// //     try {
// //       await _auth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'weak-password') {
// //         showSnackbar(context, 'The password provided is too weak.');
// //       } else if (e.code == 'email-already-in-use') {
// //         showSnackbar(context, 'The account already exists for that email.');
// //       } else {
// //         Navigator.pushNamed(context, "/Homepage");
// //         showSnackbar(context, 'User is successfully created.');
// //         showSnackbar(context, e.message!);
// //       }
// //     }
// //   }

// //   Future<void> signInWithEmail({
// //     required String email,
// //     required String password,
// //     required BuildContext context,
// //   }) async {
// //     try {
// //       await _auth.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       if (!_auth.currentUser!.emailVerified) {
      
// //       }
// //     } on FirebaseAuthException catch (e) {
   
// //         showSnackbar(context, e.message!);

// //     }
// //   }
// // }

