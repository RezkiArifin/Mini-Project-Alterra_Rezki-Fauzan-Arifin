import 'package:floor/floor.dart';

@entity
class TodoModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String taskName;
  final String description;
  final DateTime taskTime;
  final bool isDone;

  TodoModel(
      this.id, this.taskName, this.description, this.taskTime, this.isDone);
}
