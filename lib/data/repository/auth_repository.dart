import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:psony/data/models/local_user.dart';

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

  Future<void> addUser(
      {required String name,
      required String gender,
      required String uid,
      required String phone}) async {
    return await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "uid": uid,
      "phone": phone,
      "name": name,
      "gender": gender,
    });
  }

  String getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }

  Future<void> logout() async {
    return (await _firebaseAuth.signOut());
  }
}
