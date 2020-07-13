import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoey/screen/tasks.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance();
    }
		return _databaseHelper;
	}

  Future<Database> get database async{

    if(_database == null){
      _database = await initializeDatabase();
    
    }

    return _database;

  }

  Future<Database> initializeDatabase() async{

    return await openDatabase( 
      join(await getDatabasesPath(),'todolist.db'),
      onCreate: (db,version) async{

        await db.execute('''
        CREATE TABLE todos(
            id INTEGER PRIMARY KEY,name TEXT,isDone INTEGER
        )
        ''');

      },
      version: 1,
     );


  }

  Future<int> insertTodo(Tasks todo) async{

    Database db = await this.database;
    var result = await db.insert('todos', todo.toMap());
    return result;

  }


  Future<List<Map<String,dynamic>>> getTodoMapList() async{
    
    Database db = await this.database;
    var result = await db.query('todos');
    return result;
  }

  Future<int> updateTodo(Tasks todo) async{
    Database db = await this.database;
    var result = await db.update('todos', todo.toMap() , where: 'id = ?', whereArgs: [todo.id]);
    return result;
  }
  
  Future<int> deleteTodo(int id) async{
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM todos WHERE id = $id');
    return result;
  }

  Future<List<Tasks>> getTodoList() async{
    var todoMapList = await getTodoMapList();
    int count = todoMapList.length;

    List<Tasks> todoList = List<Tasks>();

    for(int i=0 ; i<count ; i++){
      todoList.add(Tasks.fromMapObject(todoMapList[i]));
    }
    return todoList;

  }

}

  
  
