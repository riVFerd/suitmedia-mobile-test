part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SelectUser extends UserEvent {
  final User user;

  SelectUser(this.user);
}
