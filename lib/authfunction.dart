import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Cutom%20Dialog/customdialog.dart';

class AuthFunction{
  Future<User?> auth(BuildContext context,String email,String password)async{
   try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return userCredential.user;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
 showDialog(context: context, builder: (_)=>LogoutOverlay(message: "${e.message}"));
  } else if (e.code == 'wrong-password') {
  showDialog(context: context, builder: (_)=>LogoutOverlay(message: "${e.message}"));
  }
}
  }

  Future<User?> signup(BuildContext context,String email,String password)async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password:password
  );
  return userCredential.user;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    showDialog(context: context, builder: (_)=>LogoutOverlay(message: "${e.message}"));
  } else if (e.code == 'email-already-in-use') {
   showDialog(context: context, builder: (_)=>LogoutOverlay(message: "${e.message}"));
  }
} catch (e) {
  showDialog(context: context, builder: (_)=>LogoutOverlay(message: "${e}"));
}
  }
  }
