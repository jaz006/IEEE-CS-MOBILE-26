import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_18/cache/cache_helper.dart';
import 'package:task_18/core/api/dio_consumer.dart';
import 'package:task_18/cubit/user_cubit.dart';
import 'package:task_18/repositories/user_repository.dart';
import 'package:task_18/screens/sign_in_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
