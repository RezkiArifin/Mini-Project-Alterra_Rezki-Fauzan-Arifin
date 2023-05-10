import 'package:floor/floor.dart';
import 'package:mini_project/models/todo_model.dart';

@dao
abstract class TodoModelDao {
  @Query('SELECT * FROM TodoModel WHERE isDone = 0')
  Stream<List<TodoModel>> findAllTodoAsStream();

  @Query('SELECT * FROM TodoModel WHERE isDone = 1')
  Stream<List<TodoModel>> findAllTodoArchiveAsStream();

  @Query('SELECT * FROM TodoModel WHERE id = :id')
  Stream<TodoModel?> findTodoById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTodo(TodoModel todoModel);

  @Query('DELETE FROM TodoModel WHERE id = :id')
  Future<void> deleteTodo(int id);

  @Query('UPDATE TodoModel set isDone = 1 WHERE id = :id')
  Future<void> makeItDoneTodo(int id);
}
