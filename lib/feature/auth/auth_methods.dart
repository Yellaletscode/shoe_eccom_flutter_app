import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/users_model.dart';
import 'storage_methods.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    if (currentUser != null) {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(currentUser.uid).get();
      if (snap.exists) {
        return UserModel.fromSnap(snap);
      } else {
        throw Exception('user document not found');
      }
    } else {
      throw Exception('user not authenticated');
    }
  }
  // sign up user

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // adding the users profile to the firebase storage
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user to our database

        UserModel user = UserModel(
            email: email,
            uid: userCredential.user!.uid,
            photoUrl: photoUrl,
            bio: bio,
            followers: [],
            following: [],
            username: username);

        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //Function for Logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
