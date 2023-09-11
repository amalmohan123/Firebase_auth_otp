import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomepageModel extends ChangeNotifier {
  Uint8List? image;

  void setImage(Uint8List img) {
    image = img;
    notifyListeners();
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, "/Loginpage");
  }
}