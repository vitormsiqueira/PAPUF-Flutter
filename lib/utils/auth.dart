// Esse arquivo é responsável por criar um "portal" para gerenciar autenticações e criação de novos usuários

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

// Abstract class its way to create a interface to implement the class auth
abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signedOut();
}

// Generic autorization component
class Auth implements BaseAuth {
  //
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user != null ? user.uid : null;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user != null ? user.uid : null;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signedOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print('Another error $e');
      return null;
    }
  }
}
