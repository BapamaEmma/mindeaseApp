import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindease_app/Navbar.dart';
import 'package:mindease_app/Services/database.dart';

class Authservice {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> signInwithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        //Await the authentication object
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Create Firebase credential
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        // Sign in to Firebase
        UserCredential result = await auth.signInWithCredential(credential);
        User? userdetails = result.user;

        if (userdetails != null) {
          // Save user info to database
          Map<String, dynamic> userInfoMap = {
            "uid": userdetails.uid,
            "email": userdetails.email,
            "Name": userdetails.displayName,
            "photoUrl": userdetails.photoURL,
          };

          await DatabaseMethods().addUser(userdetails.uid, userInfoMap);

          //Navigate to home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Navigation()),
          );
        }
      } else {
        // User canceled Google Sign-In
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Sign-in cancelled by user")));
      }
    } catch (e) {
      // Handle errors
      print("Error during Google Sign-In: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to sign in with Google: $e")),
      );
    }
  }
}
