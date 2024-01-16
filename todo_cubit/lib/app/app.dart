import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/app/pages/home/cubit/todo_cubit.dart';
import 'package:todo_cubit/app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        title: 'Todo Cubit',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomePage(title: 'Todo Cubit'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
