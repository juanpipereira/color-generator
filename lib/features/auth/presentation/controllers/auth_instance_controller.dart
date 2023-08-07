import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_instance_controller.g.dart';

@riverpod
class AuthInstanceController extends _$AuthInstanceController {
  @override
  FirebaseAuth build() {
    return FirebaseAuth.instance;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await state.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error Occured'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("OK"))
            ],
          ),
        );
      }
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await GoogleSignIn().disconnect();
    await state.signOut();
  }
}
