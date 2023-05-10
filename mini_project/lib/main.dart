import 'package:flutter/material.dart';
import 'package:mini_project/database/todo_db.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/provider/form_provider.dart';
import 'package:provider/provider.dart';

import 'database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FormProvider>(
          create: (_) => FormProvider(),
        ),
      ],
      child: MyApp(todoDao: database.todoDao),
    ),
  );
}

class MyApp extends StatelessWidget {
  final TodoModelDao todoDao;
  const MyApp({super.key, required this.todoDao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      home: HomePage(dao: todoDao),
    );
  }
}
