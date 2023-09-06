import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singUpWithEmailAndpassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Same error occured");
    }
    return null;
  }

  Future<User?> singInWithEmailAndpassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Same error occured");
    }
    return null;
  }
}
