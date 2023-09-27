import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/database/database.dart';

class todo_tile extends StatelessWidget {
  todo_tile({
    super.key,
    required this.todo,
    required this.index,
  });
  final todolist todo;
  final int index;

  final todobox = Hive.box<todolist>('mybox');

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.purple,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              todo.description,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              deletetodo(index);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ));
  }

  void deletetodo(int index) {
    todobox.deleteAt(index);
  }
}
