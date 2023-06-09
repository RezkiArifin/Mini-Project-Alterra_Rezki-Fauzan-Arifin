import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/app_database.dart';
import '../models/todo_model.dart';

class FormProvider with ChangeNotifier {
  DateTime? dateSelected;
  TimeOfDay? timeSelected;
  DateTime? dateResult;

  void selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      dateSelected = picked;
      dateResult = picked;
      notifyListeners();
    }
  }

  void selectedTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 00, minute: 00),
    );
    if (picked != null) {
      timeSelected = picked;
      dateResult = dateResult!.add(
        Duration(hours: picked.hour, minutes: picked.minute),
      );
      // timeController.text =
      //     DateFormat('dd/MM/yyyy hh:mm').format(dateResult!);
      notifyListeners();
    }
  }

  void addTodo(TodoModel todo) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final todoDao = database.todoDao;

    await todoDao.insertTodo(todo);
  }
}
