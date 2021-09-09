import 'package:flutter/cupertino.dart';
import 'package:inspire/data/models/local_user.dart';

class AuthRepository with ChangeNotifier {
  Future<LocalUser?> getUser() async {}

  Future<void> addUser({required String phone}) async {}

  Future<void> logout() async {}
}
