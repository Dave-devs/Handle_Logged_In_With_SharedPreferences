import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';

//For the thick line under Log in text
AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Log in',
      style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        height: 1.0, //Height for line thickness
        color: AppColor.primarySecondaryBackground,
      ),
    ),
  );
}

//For the third party login means
Widget buildThirdPartyLogin(BuildContext context) { //Context to access the bloc
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}


Widget _reusableIcons(String iconPath) {
  return GestureDetector(
    onTap: () {
      //TODO: Callback function to trigger action on each button
    },
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset('assets/icons/$iconPath.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp
      ),
    ),
  );
}

Widget buildTextField(
    String hintText,
    String inputType,
    String iconText,
    void Function(String name)? func
    ) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColor.primary4EleText)
    ),
    child: Row(
      children: [
        //The leading icon
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconText.png'),
        ),

        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) {
              func!(value);
              },
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              hintText:  hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              hintStyle: const TextStyle(
                color: AppColor.primarySecEleText
              )
            ),
            style: TextStyle(
                color: AppColor.primaryText,
                fontFamily: 'Avenir',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            ),
            autocorrect: false,
            obscureText: inputType == 'password' ? true : false,
          ),
        )
      ],
    )
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w),
    child: GestureDetector(
      onTap: () {
        //TODO: Give it a function to recover password
      },
      child: Text(
        'forgot password',
        style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
            decorationColor: AppColor.primaryText
        ),
      ),
    ),
  ) ;
}

Widget buildLoginRegButton(String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: buttonType == 'login' ? AppColor.primaryElement : AppColor.primaryBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: buttonType == 'login' ? Colors.transparent : AppColor.primary4EleText
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0,1)
          )
        ]
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonType == 'login' ? AppColor.primaryBackground : AppColor.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    ),
  );
}