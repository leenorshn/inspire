import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:inspire/data/models/local_user.dart';

class AuthRepository with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> onAuthStateChanged() {
    return _firebaseAuth.authStateChanges();
  }

  Future<LocalUser?> getUser() async {
    User? user = _firebaseAuth.currentUser;

    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    if (!data.exists) {
      return null;
    } else {
      return LocalUser.fromJson(data.data());
    }
  }

  Future<void> addUser({required String phone}) async {
    var user = await FirebaseAuth.instance.signInAnonymously();
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(user.user!.uid)
        .set({
      "uid": user.user!.uid,
      "phone": phone,
    });
  }

  String getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }

  Future<void> logout() async {
    return (await _firebaseAuth.signOut());
  }
}
