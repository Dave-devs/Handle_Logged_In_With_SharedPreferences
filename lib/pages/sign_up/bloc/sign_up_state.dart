part of 'sign_up_bloc.dart';

class SignUpState { //final variable help to safeguard from outside factors
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({ this.userName = "", this.email = "", this.password = "", this.confirmPassword = "" });


  //If you have immutable classes and want more new object its advisable to use copyWith object
  //CopyWith base on old and new value update
  SignUpState copyWith({ String? userName,  String? email, String? password, String? confirmPassword }) { //Optional named parameter with '?'
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword
    );
  }
}