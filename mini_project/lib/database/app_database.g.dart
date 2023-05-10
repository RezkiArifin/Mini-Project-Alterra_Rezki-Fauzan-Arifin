// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoModelDao? _todoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TodoModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `taskName` TEXT NOT NULL, `description` TEXT NOT NULL, `taskTime` INTEGER NOT NULL, `isDone` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoModelDao get todoDao {
    return _todoDaoInstance ??= _$TodoModelDao(database, changeListener);
  }
}

class _$TodoModelDao extends TodoModelDao {
  _$TodoModelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _todoModelInsertionAdapter = InsertionAdapter(
            database,
            'TodoModel',
            (TodoModel item) => <String, Object?>{
                  'id': item.id,
                  'taskName': item.taskName,
                  'description': item.description,
                  'taskTime': _dateTimeConverter.encode(item.taskTime),
                  'isDone': item.isDone ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoModel> _todoModelInsertionAdapter;

  @override
  Stream<List<TodoModel>> findAllTodoAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM TodoModel WHERE isDone = 0',
        mapper: (Map<String, Object?> row) => TodoModel(
            row['id'] as int?,
            row['taskName'] as String,
            row['description'] as String,
            _dateTimeConverter.decode(row['taskTime'] as int),
            (row['isDone'] as int) != 0),
        queryableName: 'TodoModel',
        isView: false);
  }

  @override
  Stream<List<TodoModel>> findAllTodoArchiveAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM TodoModel WHERE isDone = 1',
        mapper: (Map<String, Object?> row) => TodoModel(
            row['id'] as int?,
            row['taskName'] as String,
            row['description'] as String,
            _dateTimeConverter.decode(row['taskTime'] as int),
            (row['isDone'] as int) != 0),
        queryableName: 'TodoModel',
        isView: false);
  }

  @override
  Stream<TodoModel?> findTodoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM TodoModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TodoModel(
            row['id'] as int?,
            row['taskName'] as String,
            row['description'] as String,
            _dateTimeConverter.decode(row['taskTime'] as int),
            (row['isDone'] as int) != 0),
        arguments: [id],
        queryableName: 'TodoModel',
        isView: false);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM TodoModel WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> makeItDoneTodo(int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE TodoModel set isDone = 1 WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertTodo(TodoModel todoModel) async {
    await _todoModelInsertionAdapter.insert(
        todoModel, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
