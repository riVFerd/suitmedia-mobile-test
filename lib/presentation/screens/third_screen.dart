import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia/logic/bloc/list_user_bloc.dart';
import 'package:flutter_suitmedia/logic/bloc/user_bloc.dart';
import 'package:flutter_suitmedia/logic/models/user.dart';
import 'package:flutter_suitmedia/presentation/theme/theme_constants.dart';
import 'package:flutter_suitmedia/presentation/widgets/app_bar.dart';
import 'package:flutter_suitmedia/presentation/widgets/user_card.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  static const routeName = '/third-screen';

  @override
  Widget build(BuildContext context) {
    int page = 1;
    int pageSize = 10;

    return Scaffold(
      appBar: getStyledAppBar(context, 'Third Screen'),
      body: Padding(
        padding: ThemeConstants.screenPadding,
        child: BlocBuilder<ListUserBloc, ListUserState>(
          builder: (context, state) {
            if (state is ListUserInitial) {
              BlocProvider.of<ListUserBloc>(context).add(FetchListUser(page, pageSize));
            } else if (state is ListUserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListUserLoaded) {
              return ListUser(
                users: state.users,
                hasReachedMax: state.hasReachedMax,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ListUser extends StatefulWidget {
  final List<User> users;
  final bool hasReachedMax;

  const ListUser({super.key, required this.users, required this.hasReachedMax});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.users.length) {
          final user = widget.users[index];
          return UserCard(
            user: user,
            onTap: () {
              BlocProvider.of<UserBloc>(context).add(SelectUser(user));
              Navigator.pop(context);
            },
          );
        } else if (widget.hasReachedMax) {
          return const Center(
            child: Text('No more users'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
