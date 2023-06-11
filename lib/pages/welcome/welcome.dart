import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/utils/app_layout.dart';
import '../../common/values/colors.dart';
import '../../common/values/constants.dart';
import '../../global.dart';
import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_events.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //Page controller for animation within page view screens.
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index; //Assign page of welcome state to page view index at 0.
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent()); //Call Welcome event to trigger the event
                  },
                  children: [
                    _onboardingPage(
                      1,
                      context,
                      'assets/images/reading.png',
                      'First time learner?',
                      'Forget about the hassle of learning on different platform!',
                      'Next'
                    ),
                    _onboardingPage(
                      2,
                      context,
                      'assets/images/boy.png',
                      'U-Learning is the way',
                      'Get access to millions of learning resources from us!',
                      'Next'
                    ),
                    _onboardingPage(
                      3,
                      context,
                      'assets/images/man.png',
                      'Chat with our tutors',
                      'Chat with our experienced tutors that specializes in different courses',
                      'Get Started'
                    ),
                ],
              ),

              //Page dot indicator
              Positioned(
                  bottom: AppLayout.getHeight(GetPlatform.isAndroid == true ? 60.h : 100.h),
                  child: DotsIndicator(
                    position: state.page, //Assign the index of page view parameter to dot indicator position to follow suit.
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: AppColor.primary3EleText,
                        activeColor: AppColor.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  )
              )
            ],
          ),
        );
  },
)
      )
    );
  }
  
  //Reusable onboarding widget page for welcome screen in PageView
  Widget _onboardingPage(
      int index,
      BuildContext context,
      String illustrationPath,
      String title,
      String subTitle,
      String buttonName
      ) {
    return  Column(
      children: [
        //For illustration Image
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(illustrationPath, fit: BoxFit.cover,),
        ),

        //First middle text
        Container(
          child: Text(
            title,
            style: TextStyle(color: AppColor.primaryText, fontSize: 24.sp, fontWeight: FontWeight.normal),
          ),
        ),

        //Second middle text
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(color: AppColor.primarySecEleText, fontSize: 14.sp, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),

        //The blue button
        GestureDetector(
          onTap: () {
            if(index < 3) { //Move to next screen within page view.
              //Animates the controlled PageView from the current page to the given page.
              pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate
              );
            } else { //Navigate to a new page.
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 40.h : 5.h),
            decoration: BoxDecoration(
                color: AppColor.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 1)
                  )
                ]
            ),
            child: Center(child: Text(buttonName, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),)),
          ),
        )
      ],
    );
  }
}
