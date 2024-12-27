import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final instance = FirebaseAuth.instance;

  Future<UserCredential?> createUser(String email, String password) async {
    return await instance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    return await instance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    return await instance.signOut();
  }

  Future<UserCredential?> googleSignin() async {
    GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? credential = await googleSignIn!.authentication;

    final userCredential = GoogleAuthProvider.credential(
        accessToken: credential.accessToken, idToken: credential.idToken);

    return await instance.signInWithCredential(userCredential);
  }
}

class FirestoreServices {
  final firestore = FirebaseFirestore.instance.collection('users');
  final instance = FirebaseAuth.instance.currentUser;

  createData(String message, BuildContext context) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('create successfully')));
      return await firestore.add({
        'mail': instance?.email,
        'message': message,
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('create failed')));
    }
  }

  updateData(String message, String id, BuildContext context) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('update successfully')));
      return await firestore.doc(id).update({
        'message': message,
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('update failed')));
    }
  }

  // deleteData(String id, BuildContext context) async {
  //   try {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('delete successfully')));
  //     return await firestore.doc(id).delete();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('delete failed')));
  //   }
  // }
}
