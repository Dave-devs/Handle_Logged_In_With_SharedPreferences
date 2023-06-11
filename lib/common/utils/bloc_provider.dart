import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/application/bloc/application_bloc.dart';
import '../../pages/sign_in/bloc/signin_bloc.dart';
import '../../pages/sign_up/bloc/sign_up_bloc.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';

class BlocProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc(),),
    BlocProvider(create: (context) => SignInBloc(),),
    BlocProvider(create: (context) => SignUpBloc(),),
    BlocProvider(create: (context) => ApplicationBloc(),),
  ];
}