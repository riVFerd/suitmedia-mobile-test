import 'package:bloc/bloc.dart';
import 'package:flutter_suitmedia/logic/models/user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SelectUser>((event, emit) {
      emit(UserLoaded(event.user));
    });
  }
}
