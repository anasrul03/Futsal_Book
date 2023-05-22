// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:fireauth/fireauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.initial()) {
    checkSignin();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: AuthenticationStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: AuthenticationStatus.initial));
  }

//Checking if the user sign in or not
  Future<void> checkSignin() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      emit(state.copyWith(user: user));
    }
  }

  Future signUp(BuildContext context, String email, String password) async {
    print("Running Firebase Create user");
    try {
      final createUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
          msg: "Successfully Registered! as $email",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      print("Error : $e");

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

      Fluttertoast.showToast(
          msg: "Firebase Error!: $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      print("Error : $e");
      Fluttertoast.showToast(
          msg: "Error Catch! >> $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future signIn(BuildContext context, bool loaded) async {
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(user: user.user));
      print(user);
      Fluttertoast.showToast(
          msg: "Successfully Logged as ${state.email}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      // ));
    } catch (e) {
      print("ERROR: $e");
      Fluttertoast.showToast(
          msg: "Please input a correct email and password !!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    loaded = false;
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future signOut(BuildContext context) async {
    try {
      GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(
          email: "", password: "", status: AuthenticationStatus.initial));
      Fluttertoast.showToast(
          msg: "Logged out",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Error Catch! >> $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error Catch! >> $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future signInAnonymous(context) async {
    try {
      var user = await FirebaseAuth.instance.signInAnonymously();

      Fluttertoast.showToast(
          msg: "Sign in as Anon",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(state.copyWith(user: user.user));
    } catch (e) {
      print("ERROR: $e");
      Fluttertoast.showToast(
          msg: "Cannot Log! Anon : $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
