import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future initialize() {
    return Firebase.initializeApp();
  }

  AuthUser? currentUser() {
    return AuthUser.fromFirebase(_auth.currentUser!);
  }

  Future sendEmailVerification({required String email}) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user!.uid;
    } on FirebaseAuthException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addUsername(String name) async {
    try {
      if (currentUser() != null) {
        _auth.currentUser!.updateDisplayName(name);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<AuthUser> createAccountWithEmailAndPassword({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      user!.updateDisplayName(username);
      return AuthUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future forgetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }
}

class AuthUser {
  final String userId;
  final String username;
  const AuthUser({required this.username, required this.userId});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(userId: user.uid, username: user.displayName ?? "Anonymous");
}
