import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnContent = "content";
final String columnImageUrl = "imageUrl";
final String columnCreatedAt = "createdAt";

class News {
  int? id;
  late String title;
  late String content;
  late String createdAt;
  late String imageUrl;

  News(
      {required this.title,
      required this.content,
      required this.imageUrl,
      required this.createdAt,
      this.id});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnTitle: title,
      columnContent: content,
      columnImageUrl: imageUrl,
      columnCreatedAt: createdAt
    };

    return map;
  }

  News.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    content = map[columnContent];
    imageUrl = map[columnImageUrl];
    createdAt = map[columnCreatedAt];
  }
}

class NewsProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnContent text,
  $columnImageUrl text ,
  $columnCreatedAt text not null)
''');
    });
  }

  Future<News> insert(News news) async {
    news.id = await db.insert(tableTodo, news.toMap());
    return news;
  }

  Future<News?> getOneNews(String title) async {
    List<Map<String, dynamic>> maps = await db.query(tableTodo,
        columns: [columnId, columnTitle],
        where: '$columnTitle = ?',
        whereArgs: [title]);
    if (maps.length > 0) {
      return News.fromMap(maps.first);
    }
    return null;
  }

  Future<List<News>> getNews() async {
    List<Map> maps = await db.query(tableTodo,
        columns: [
          columnId,
          columnTitle,
          columnContent,
          columnImageUrl,
          columnCreatedAt
        ],
        orderBy: columnCreatedAt);

    return maps.map((e) => News.fromMap(e as Map<String, dynamic>)).toList();
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
