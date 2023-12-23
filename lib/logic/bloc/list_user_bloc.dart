import 'package:bloc/bloc.dart';
import 'package:flutter_suitmedia/logic/models/user.dart';
import 'package:meta/meta.dart';

part 'list_user_event.dart';
part 'list_user_state.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  ListUserBloc() : super(ListUserInitial()) {
    on<FetchListUser>((event, emit) async {
      final currentUsers = state is ListUserLoaded ? (state as ListUserLoaded).users : <User>[];
      emit(ListUserLoading());
      try {
        final newUsers = await User.getUsers(event.page, event.pageSize);
        emit(ListUserLoaded(currentUsers + newUsers, newUsers.length < event.pageSize));
      } catch (e) {
        emit(ListUserLoaded(currentUsers, true));
      }
    });
    on<ResetListUser>((event, emit) {
      emit(ListUserInitial());
    });
  }
}
