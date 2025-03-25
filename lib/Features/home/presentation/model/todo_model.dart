import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  int color;

  TodoModel(
    this.color, {
    required this.title,
    required this.description,
    required this.date,
  });
}
