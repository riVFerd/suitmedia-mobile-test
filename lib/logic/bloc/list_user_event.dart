part of 'list_user_bloc.dart';

@immutable
abstract class ListUserEvent {}

class FetchListUser extends ListUserEvent {
  final int page;
  final int pageSize;

  FetchListUser(this.page, this.pageSize);
}

class ResetListUser extends ListUserEvent {}
