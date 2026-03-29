import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/screens/add_tasks_screen.dart';
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
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;

  late Database database;
  List<Map> tasks = [];

  // INIT STATE
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  //  SCREENS
  List<Widget> get screens => [
        TasksScreen(tasks: tasks),
        const ArchiveScreen(),
        const DoneScreen(),
      ];

  // CREATE DATABASE
  void createDatabase() async {
    database = await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)',
        );
      },
      onOpen: (database) async {
        getDataFromDatabase(database);
      },
    );
  }

  // INSERt
  Future<void> insertToDatabase({
    required String title,
    required String time,
    required String date,
    required String status,
  }) async {
    await database.insert('tasks', {
      'title': title,
      'time': time,
      'date': date,
      'status': status,
    });

    getDataFromDatabase(database);
  }

  // get database
  void getDataFromDatabase(Database database) async {
    final data = await database.rawQuery('SELECT * FROM tasks');

    setState(() {
      tasks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: const Color.fromRGBO(169, 186, 171, 1),

      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(169, 186, 171, 1),
        title: Row(
          children: const [
            Icon(Icons.format_list_bulleted_sharp, color: Colors.white),
            SizedBox(width: 8),
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
        children: screens,
      ),

      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () async {
          if (isBottomSheetShow) {
            if (formKey.currentState!.validate()) {
              await insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
                status: 'new', 
              );

              Navigator.pop(context);

              // clear fields
              titleController.clear();
              timeController.clear();
              dateController.clear();

              isBottomSheetShow = false;
            }
          } else {
            _scaffoldkey.currentState!
                .showBottomSheet(
                  (context) => AddTasksScreen(
                    formKey: formKey,
                    titleController: titleController,
                    timeController: timeController,
                    dateController: dateController,
                  ),
                )
                .closed
                .then((value) {
              isBottomSheetShow = false;
            });

            isBottomSheetShow = true;
          }
        },
      ),

      // BOTTOM BAR
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.grey,
        notchColor: Colors.black87,
        elevation: 1,
        showLabel: true,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        kIconSize: 24,
        kBottomRadius: 28,

        bottomBarItems: [
          bottomBarItem(icon: Icons.home, text: 'Tasks'),
          bottomBarItem(icon: Icons.archive, text: 'Archive'),
          bottomBarItem(icon: Icons.check_box, text: 'Done'),
        ],

        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}