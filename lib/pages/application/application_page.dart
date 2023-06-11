import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handle_logged_in_with_sharedpreferences/pages/application/widget/application_widget.dart';
import '../../common/values/colors.dart';
import 'bloc/application_bloc.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
    builder: (context, state) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPageScreen(state.index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColor.primaryElement,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1
                )
              ]
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                context.read<ApplicationBloc>().add(NavigateEvent(value));
              },
              currentIndex: state.index,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColor.primaryElement,
              unselectedItemColor: AppColor.primary4EleText,
              items: bottomTabs,
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
