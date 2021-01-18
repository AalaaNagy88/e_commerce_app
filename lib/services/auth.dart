import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future signUp(String email, String password) async {
    UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }

  changePassword(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  Future signIn(String email, String password) async {
    UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }
}
