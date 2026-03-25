import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/screens/archive_screen.dart';
import 'package:todo/screens/done_screen.dart';
import 'package:todo/screens/tasks_screen.dart';
import 'package:todo/widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;

  List<Widget> screens = const [TasksScreen(), ArchiveScreen(), DoneScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
        title: Row(
          children: [
            Icon(Icons.format_list_bulleted_sharp, color: Colors.white),
            Text(
              'All Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(screens.length, (index) => screens[index]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShow) {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
              isBottomSheetShow = false;
            }
          } else {
            _scaffoldkey.currentState!
                .showBottomSheet((context) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defultFormField(
                            Controller: titleController,
                            labelText: 'Task Name',
                            icon: Icons.title,
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          defultFormField(
                            Controller: timeeController,
                            labelText: 'Task Time',
                            icon: Icons.timer_rounded,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeeController.text = value!.format(context);
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          defultFormField(
                            Controller: dateController,
                            labelText: 'Task Date',
                            icon: Icons.date_range,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                lastDate: DateTime.parse('2030-08-27'),
                              ).then((value) {
                                dateController.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                })
                .closed
                .then((value) {
                  isBottomSheetShow = false;
                });

            isBottomSheetShow = true;
          }
        },
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Colors.grey,
        notchBottomBarController: _controller,
        notchColor: Colors.black87,
        elevation: 1,
        showLabel: true,
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          bottomBarItem(icon: Icons.home, text: 'Tasks'),
          bottomBarItem(icon: Icons.archive, text: 'Archive'),
          bottomBarItem(icon: Icons.check_box, text: 'Done'),
        ],
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
    );
  }
}
