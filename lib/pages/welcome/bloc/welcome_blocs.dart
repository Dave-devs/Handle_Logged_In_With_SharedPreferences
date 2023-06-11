import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handle_logged_in_with_sharedpreferences/pages/welcome/bloc/welcome_events.dart';
import 'welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}