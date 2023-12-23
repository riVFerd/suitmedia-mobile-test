import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia/logic/models/user.dart';

part 'list_user_event.dart';
part 'list_user_state.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  ListUserBloc() : super(ListUserInitial()) {
    on<FetchListUser>((event, emit) async {
      final currentUsers = state is ListUserLoaded ? (state as ListUserLoaded).users : <User>[];
      try {
        final newUsers = await User.getUsers(event.page, event.pageSize);
        emit(
          ListUserLoaded(
            currentUsers + newUsers,
            !((currentUsers.length + newUsers.length) < User.totalUsers),
          ),
        );
      } catch (e) {
        emit(ListUserLoaded(currentUsers, true));
      }
    });
    on<ResetListUser>((event, emit) {
      emit(ListUserInitial());
    });
  }
}
