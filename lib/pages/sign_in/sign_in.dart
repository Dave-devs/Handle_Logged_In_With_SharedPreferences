import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handle_logged_in_with_sharedpreferences/pages/sign_in/sign_in_controller.dart';
import '../../common/utils/common_widget.dart';
import 'bloc/signin_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,

                appBar: buildAppBar('Log In'),
                //This is the login text and the appBar theme container at the top

                body: SingleChildScrollView(

                  child: Column( //This column contain the third party login means and its bottom text
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(child: reusableText('Or login with your email')),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('Email'),
                            SizedBox(height: 5.h,),
                            buildTextField('Input your email', 'email', 'user',
                              (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }
                            ),

                            reusableText('Password'),
                            SizedBox(height: 5.h,),
                            buildTextField('Input your password', 'password', 'lock',
                                (value) {
                                context.read<SignInBloc>().add(PasswordEvent(value));
                                }
                            )
                          ],
                        ),
                      ),
                      forgotPassword(),
                      buildLoginRegButton('Log In', 'login', () {
                        SignInController(context: context).handleSignIn('email');
                      }),
                      buildLoginRegButton('Sign Up', 'sign up', () {
                        Navigator.of(context).pushNamed("/sign_up");
                      }),
                    ],
                  ),
                ),
              )
          ),
        );
      },
    );
  }
}
