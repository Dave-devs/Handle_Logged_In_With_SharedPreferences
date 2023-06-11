import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPageScreen(int index) {
  List<Widget> _widget = [
    const Center(child: Text('Home'),),
    const Center(child: Text('Search'),),
    const Center(child: Text('Course'),),
    const Center(child: Text('Chat'),),
    const Center(child: Text('Profile'),),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/home.png'),),
    activeIcon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/home.png'),),
    label: "Home",
  ),
  BottomNavigationBarItem(
      icon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/search2.png'),),
      activeIcon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/search2.png'),),
      label: "Search"
  ),
  BottomNavigationBarItem(
      icon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/play-circle1.png'),),
      activeIcon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/play-circle1.png'),),
      label: "Course"
  ),
  BottomNavigationBarItem(
      icon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/message-circle.png'),),
      activeIcon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/message-circle.png'),),
      label: "Chat"
  ),
  BottomNavigationBarItem(
      icon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/person2.png'),),
      activeIcon: SizedBox(width: 15.w, height: 15.h, child: Image.asset('assets/icons/person2.png'),),
      label: "Profile"
  )
];