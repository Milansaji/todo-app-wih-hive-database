import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/database/database.dart';

import 'package:todo/models/todo_tile.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _textEditingController = TextEditingController();

  final todobox = Hive.box<todolist>('mybox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
          title: Text('TO-DO'),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('add todo'),
                            content: TextField(
                              controller: _textEditingController,
                              onChanged: (value) {},
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    if (_textEditingController.text != '') {
                                      addtodo(_textEditingController.text);
                                      _textEditingController.clear();
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                      show_Snackbar();
                                    }
                                  },
                                  child: Text('save')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _textEditingController.clear();
                                  },
                                  child: Text('Cancel'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add)),
            )
          ]),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: todobox.listenable(),
            builder: (context, Box<todolist> box, _) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final todo = box.getAt(index)!;
                  return todo_tile(
                    todo: todo,
                    index: index,
                  );
                },
                itemCount: box.length,
              );
            }),
      ),
    );
  }

  void addtodo(String description) {
    final todo = todolist(description: description);
    todobox.add(todo);
  }

  void show_Snackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'please fill your todo',
        style: TextStyle(color: Colors.red),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    ));
  }
}
