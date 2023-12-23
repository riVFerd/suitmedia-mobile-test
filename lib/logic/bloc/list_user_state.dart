part of 'list_user_bloc.dart';

@immutable
abstract class ListUserState {}

class ListUserInitial extends ListUserState {}

class ListUserLoading extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<User> users;
  final bool hasReachedMax;

  ListUserLoaded(this.users, this.hasReachedMax);
}
