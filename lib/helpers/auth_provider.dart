import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthProvider with ChangeNotifier {
  User fireBaseuser;
  StreamSubscription userAuthSub;

  AuthProvider() {
    userAuthSub = FirebaseAuth.instance.onAuthStateChanged.listen((newUser) {
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $newUser');
      fireBaseuser = newUser;
      notifyListeners();
    }, onError: (e) {
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $e');
    });
  }

  @override
  void dispose() {
    if (userAuthSub != null) {
      userAuthSub.cancel();
      userAuthSub = null;
    }
    super.dispose();
  }

  bool get isAuthenticated {
    return fireBaseuser != null;
  }

  Future<User> signInWithEmail(
      {@required String email, @required String password}) async {
    var result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    fireBaseuser = result.user;

    assert(fireBaseuser != null);
    assert(await fireBaseuser.getIdToken() != null);

    return fireBaseuser;
  }

  Future<User> signUpWithEmail(
      {@required String email, @required String password}) async {
    var result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    fireBaseuser = result.user;

    assert(fireBaseuser != null);
    assert(await fireBaseuser.getIdToken() != null);
    return fireBaseuser;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}

//exeption handeling
String getExceptionText(Exception e) {
  if (e is PlatformException) {
    switch (e.message) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        return 'User with this e-mail not found.';
        break;
      case 'The password is invalid or the user does not have a password.':
        return 'Invalid password.';
        break;
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        return 'No internet connection.';
        break;
      case 'The email address is already in use by another account.':
        return 'Email address is already taken.';
        break;
      default:
        return 'Unknown error occured.';
    }
  } else {
    return 'Unknown error occured.';
  }
}
