import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/values/constants.dart';
import '../../common/widget/fluuter_toast.dart';
import '../../global.dart';
import 'bloc/signin_bloc.dart';

class SignInController{

  final BuildContext context;

  const SignInController({ required this.context});

  Future<void> handleSignIn(String type) async {

    try{

      if(type == 'email') {
        //Inject SignInBloc
        final state = context.read<SignInBloc>().state;

        //We assign bloc states to new variable
        String emailAddress = state.email;
        String passwordInput = state.password;
        //Check if email or password is empty
        if (emailAddress.isEmpty ||  passwordInput.isEmpty) {
          toastInfo(message: 'Email or password is empty!');
        } else {
          toastInfo(message: 'Email is $emailAddress');
        }

        try{
          //Call Firebase sign in with email and password function
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress,
              password: passwordInput
          );
          //Check if user credential empty
          if(credential.user == null) {
            toastInfo(message: 'User does not exist');
            return;
          }
          //Check if user email is not verified
          if(!credential.user!.emailVerified) {
            toastInfo(message: 'User is not verified');
            return;
          }
          //Check if user email is verified
          if(credential.user!.emailVerified) {
            toastInfo(message: 'Verified user');
            return;
          }

          //User credential from Firebase assign to user variable
          var user = credential.user;
          //Check if user gotten successfully OR not
          if(user != null) {
            toastInfo(message: 'User exist');
            //This handle already signed in user to home screen
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(message: 'No user');
            return;
          }

        } on FirebaseAuthException catch(e) {
          if(e.code == 'user-not-found') {
            toastInfo(message: 'No user found for the email');
          } else if(e.code == 'wrong-password') {
            toastInfo(message: 'Wrong password provided, check and try again!');
          } else if(e.code == 'invalid-email') {
            toastInfo(message: 'Wrong email provided');
          }
        }

      }
    } catch(e) {
      print(e.toString());
    }

  }
}