import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit_services/cubit.dart';
import '../Cubit_services/states.dart';
import '../widgets/reusable_widget.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) =>
            buildListUi(context, tasks: AppCubit.get(context).archiveTasks, type: 'archive'),
        listener: (context, state) {});
  }
}