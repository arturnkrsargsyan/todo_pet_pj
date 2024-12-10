import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;

  bool checkIfUserSignedIn() {
    final user = _auth.currentUser;
    final authenticated = user != null;
    return authenticated;
  }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  // }

  Future<void> login() async {}
}
