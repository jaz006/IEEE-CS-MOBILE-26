import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/tasks_screen.dart';
import '../Cubit_services/cubit.dart';
import '../Cubit_services/states.dart';
import '../widgets/reusable_widget.dart';
import 'add_tasks_screen.dart';
import 'archive_screen.dart';
import 'done_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
  final _pageControler = PageController(initialPage: 0);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;

  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        List<Widget> screens = [
          TaskScreen(tasks: cubit.tasks),
          const ArchiveScreen(),
          const DoneScreen(),
        ];

        List<String> titles = ['Tasks','Archived',' Done'];

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color.fromARGB(255, 88, 90, 88),
            appBar: AppBar(
              automaticallyImplyActions: false,
              backgroundColor: const Color.fromARGB(255, 20, 20, 20),
            
              title: ValueListenableBuilder<int>(
                valueListenable: _valueNotifier,
                builder: (context, value, child) {
                  return Text(
                    titles[value],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          body: PageView(
            controller: _pageControler,
            physics: const NeverScrollableScrollPhysics(),
            children: screens,
            onPageChanged: (index) {
              _valueNotifier.value = index;
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 19, 19, 19),
                  Color.fromARGB(255, 19, 19, 19),
                ],
              ),
            ),
            child: FloatingActionButton(
              onPressed: () async {
                if (isBottomSheetShow) {
                  if (_formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: _titleController.text,
                      time: _timeController.text,
                      date: _dateController.text,
                      status: "status",
                    ).then((value) {
                      Navigator.pop(context);
                      isBottomSheetShow = false;
                    });
                  }
                } else {
                  _scaffoldKey.currentState!
                      .showBottomSheet((context) => AddTasksScreen(
                    formKey: _formKey,
                    titleController: _titleController,
                    timeController: _timeController,
                    dateController: _dateController,
                  ))
                      .closed
                      .then((value) {
                    isBottomSheetShow = false;
                  });
                  isBottomSheetShow = true;
                }
              },

              backgroundColor: Colors.transparent,
              elevation: 0,

              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 56, 56, 56),
                size: 35,
              ),
            ),
          ),
          bottomNavigationBar: AnimatedNotchBottomBar(
            color: const Color.fromARGB(255, 76, 75, 75),
            notchBottomBarController: _controller,
            elevation: 1,
            showLabel: true,
            removeMargins: false,
            bottomBarWidth: 500,
            showShadow: false,
            durationInMilliSeconds: 300,
            bottomBarItems: [
              bottomBarItem(
                icon: Icons.home,
                text: 'home',
              ),
              bottomBarItem(
                icon: Icons.archive,
                text: 'archived',
              ),
              bottomBarItem(
                icon: Icons.check_box,
                text: 'done',
              ),
            ],
            onTap: (int value) {
              _pageControler.jumpToPage(value);
            },
            kIconSize: 25,
            kBottomRadius: 30,
          ),
        );
      },
    );
  }
}