import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia/logic/bloc/list_user_bloc.dart';
import 'package:flutter_suitmedia/logic/bloc/user_bloc.dart';
import 'package:flutter_suitmedia/presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => ListUserBloc()),
      ],
      child: MaterialApp(
        title: 'Suitmedia Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
