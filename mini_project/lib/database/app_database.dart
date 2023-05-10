// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:mini_project/database/todo_db.dart';
import 'package:mini_project/database/type_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/todo_model.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [TodoModel])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  TodoModelDao get todoDao;
}
