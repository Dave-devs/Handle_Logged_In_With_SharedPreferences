import 'package:bloc/bloc.dart';
part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState()) {
    on<NavigateEvent>((event, emit) {
      emit(ApplicationState(index: event.index));
    });
  }
}
