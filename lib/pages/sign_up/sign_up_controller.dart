import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widget/fluuter_toast.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});


  Future<void> handleSignUpState() async {
    try{

        final state = context.read<SignUpBloc>().state;

        String userNameAddress = state.userName;
        String emailAddress = state.email;
        String passwordAddress = state.password;
        String confirmPasswordAddress = state.confirmPassword;

        if(userNameAddress.isEmpty) {
          toastInfo(message: "Username can't be empty");
          return;
        }
        if(emailAddress.isEmpty) {
          toastInfo(message: "Email can't be empty");
          return;
        }
        if(passwordAddress.isEmpty) {
          toastInfo(message: "Password can't be empty");
          return;
        }
        if(confirmPasswordAddress.isEmpty) {
          toastInfo(message: "Confirm password can't be empty");
          return;
        }
        if(confirmPasswordAddress != passwordAddress) {
          toastInfo(message: "Password does not match, check and try again!");
          return;
        }

        try{
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailAddress,
              password: passwordAddress
          );

          if(credential.user != null) {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(userNameAddress);

            toastInfo(message: "Confirmation mail sent to your email. To activate it click on the activate button");

            Navigator.of(context).pop();
          }


        } on FirebaseAuthException catch(e) {
          if(e.code == 'email-already-in-use') {
            toastInfo(message: 'User already exist');
          } else if(e.code == 'invalid-email') {
            toastInfo(message: 'Invalid email supply');
          } else if(e.code == 'weak-password') {
            toastInfo(message: 'Password is too weak');
          }
        }

    } catch(e) {
      print(e.toString());
    }
  }
}