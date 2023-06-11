import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handle_logged_in_with_sharedpreferences/pages/sign_up/sign_up_controller.dart';
import '../../common/utils/common_widget.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,

                appBar: buildAppBar('Sign Up'),
                //This is the login text and the appBar theme container at the top

                body: SingleChildScrollView(

                  child: Column( //This column contain the third party login means and its bottom text
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      Center(child: reusableText('Enter your details below for sign up')),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('Username'),
                            buildTextField('Enter a username', 'name', 'user',
                                    (value) {
                                  context.read<SignUpBloc>().add(UsernameEvent(value));
                                }
                            ),

                            reusableText('Email'),
                            buildTextField('Input your email', 'email', 'user',
                                    (value) {
                                  context.read<SignUpBloc>().add(EmailEvent(value));
                                }
                            ),

                            reusableText('Password'),
                            buildTextField('Input a password', 'password', 'lock',
                                    (value) {
                                  context.read<SignUpBloc>().add(PasswordEvent(value));
                                }
                            ),

                            reusableText('Confirm Password'),
                            buildTextField('Confirm password', 'confirmPW', 'lock',
                                    (value) {
                                  context.read<SignUpBloc>().add(ConfirmPasswordEvent(value));
                                }
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 25.w),
                          child: reusableText('Enter your details below for sign up')
                      ),
                      buildLoginRegButton('Sign up', 'login', () {
                        SignUpController(context: context).handleSignUpState();
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
