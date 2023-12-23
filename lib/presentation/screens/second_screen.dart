import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia/logic/bloc/user_bloc.dart';
import 'package:flutter_suitmedia/presentation/screens/third_screen.dart';
import 'package:flutter_suitmedia/presentation/theme/theme_constants.dart';
import 'package:flutter_suitmedia/presentation/widgets/app_bar.dart';
import 'package:flutter_suitmedia/presentation/widgets/cutom_elevated_button.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({super.key, required this.name});

  static const routeName = '/second-screen';

  void _chooseUser(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    Navigator.pushNamed(
      context,
      ThirdScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getStyledAppBar(context, 'Second Screen'),
      body: Padding(
        padding: ThemeConstants.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                String? username;
                if (state is UserLoaded) {
                  username = '${state.user.firstName} ${state.user.lastName}';
                }
                return Text(
                  username ?? 'No User Selected',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                );
              },
            ),
            CustomElevatedButton(
              text: 'Choose a User',
              onPressed: () => _chooseUser(context),
            ),
          ],
        ),
      ),
    );
  }
}
