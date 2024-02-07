// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:user_app/presentation/auth/components/google_auth.dart';

// class GoogleSignInMobileService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<GoogleAuthModel> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await _googleSignIn.signIn();
//       final ggAuth = await googleSignInAccount!.authentication;

//       print("=============");
//       log(ggAuth.idToken.toString());
//       log(ggAuth.accessToken.toString());
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       print("///${credential.token}");
//       print("///$credential");
//       await _auth.signInWithCredential(credential);
//       return GoogleAuthModel(idToken: ggAuth.idToken!, email: googleSignInAccount.email, displayName: googleSignInAccount.displayName ?? "", id: googleSignInAccount.id);
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print("/////${e.message}");
//       }
//       rethrow;
//     } catch (e) {
//       if (kDebugMode) {
//         print("/////${e.toString()}");
//       }
//       rethrow;
//     }
//   }

//   Future<void> signOutFromGoogle() async{
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }