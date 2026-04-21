import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit_services/cubit.dart';
import '../Cubit_services/states.dart';
import '../widgets/reusable_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required List<Map> tasks,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return buildListUi(context, tasks: AppCubit.get(context).tasks, type: 'home');
      },
    );
  }
}