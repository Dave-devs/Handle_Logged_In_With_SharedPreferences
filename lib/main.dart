import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/pages.dart';
import 'common/values/colors.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(
                          color: AppColor.primaryText
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0
                  )
              ),
              onGenerateRoute: AppPages.generateRouteSettings,
            ),
      ),
    );
  }
}