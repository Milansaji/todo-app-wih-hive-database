import 'package:hive/hive.dart';
part 'database.g.dart';

@HiveType(typeId: 0)
class todolist {
  todolist({required this.description, this.isdone = false});
  @HiveField(0)
  String description;
  @HiveField(1)
  bool isdone;
}
