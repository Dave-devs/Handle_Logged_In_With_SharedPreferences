part of 'application_bloc.dart';

abstract class ApplicationEvent {
  const ApplicationEvent();
}

class NavigateEvent extends ApplicationEvent {
  final int index;

  const NavigateEvent(this.index): super();
}
