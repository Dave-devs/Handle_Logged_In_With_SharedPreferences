import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/application_bloc.dart';
import '../../pages/sign_in/bloc/signin_bloc.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/bloc/sign_up_bloc.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';
import '../../pages/welcome/welcome.dart';
import 'names.dart';

//Unify bloc_providers, routes, and pages here => We fuse all three classes together here.
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;


  PageEntity({ required this.route, required this.page, required this.bloc });

}

//This is their unification
class AppPages{
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: Routes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())
      ),
      PageEntity(
          route: Routes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())
      ),
      PageEntity(
          route: Routes.SIGN_UP,
          page: const SignUpScreen(),
          bloc: BlocProvider(create: (_) => SignUpBloc())
      ),
      PageEntity(
          route: Routes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => ApplicationBloc()) //This represent bloc of a page(screen)
      ),
    ];
  }

  /*Sometimes you just want to access the provider and
  not with route or page, then we separate them to be
  able to access the provider alone.*/

  //We return all bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[ ];
    for(var bloc in routes()) {
      blocProviders.add(bloc.bloc); //Here is page's bloc added to a bloc variable with for loop's help
    }
    return blocProviders; //Then we return the added bloc here.
  }

  //Modals that covers entire screens as we click on navigator object
  //We need to generate our routes here
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    //This check for route name match when navigator gets triggered.
    if(settings.name != null) {
      var result = routes().where((element) => element.route==settings.name);

      if(result.isNotEmpty) {
        /*This handles wheather to show login screen or home screen after onboarding screen ends.
        * Onboarding screens should also be showed ones.*/
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == Routes.INITIAL && deviceFirstOpen == true){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn) {
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
        }
        //on valid route generation do this
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    //on invalid route generation do this
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}




