import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Error occurred ";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file != null ){
        //Register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(credential.user!.uid);

        String photoUrl= await StorageMethods().uploadImageToStorage('profilePics', file, false);

        //add user to db
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username':username,
          'uid': credential.user!.uid,
          'email': email,
          'password': password,
          'bio':bio,
          'photoUrl': photoUrl,
        });
        res = 'Success!';
      }
      else {
        res = "Please enter all fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
  
}