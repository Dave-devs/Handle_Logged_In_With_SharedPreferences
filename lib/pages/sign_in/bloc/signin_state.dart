part of 'signin_bloc.dart';

class SignInState { //final variable help to safeguard from outside factors
  final String email;
  final String password;

  const SignInState({ this.email = " ", this.password = " "});

  //To grab the email value and changing it
  //If you have immutable classes and want more new object its advisable to use copyWith object
  SignInState copyWith({String? email, String? password}) { //Function tat return SignInState class
    return SignInState(
      email: email ?? this.email,
      password: password?? this.password
    );
  }


}
