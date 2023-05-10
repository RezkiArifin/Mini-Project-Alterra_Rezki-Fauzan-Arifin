import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/models/todo_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../database/app_database.dart';
import '../database/todo_db.dart';

class CardWidget extends StatefulWidget {
  final TodoModelDao dao;
  final TodoModel todoModel;
  const CardWidget({
    Key? key,
    // required this.handleRefresh,
    required this.todoModel,
    required this.dao,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () async {
          await widget.dao.deleteTodo(widget.todoModel.id ?? 0);
          // widget.handleRefresh;
        }),
        children: [
          const SizedBox(
            width: 2,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(16),
            onPressed: (context) async {
              await widget.dao.makeItDoneTodo(widget.todoModel.id ?? 0);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.done_outline_rounded,
            label: 'Done',
          ),
          const SizedBox(
            width: 2,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(16),
            onPressed: (context) async {
              await widget.dao.deleteTodo(widget.todoModel.id ?? 0);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: Card(
        elevation: 10,
        shadowColor: const Color(0xff2da9ef),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          minLeadingWidth: widget.todoModel.isDone ? 0 : 2,
          leading: widget.todoModel.isDone
              ? const SizedBox()
              : Container(
                  width: 2,
                  color: const Color(0xff2da9ef),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.todoModel.taskName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(
            widget.todoModel.description,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 16,
            ),
          ),
          trailing: Text(
            widget.todoModel.isDone
                ? 'Done'
                : DateFormat('hh:mm a').format(widget.todoModel.taskTime),
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
