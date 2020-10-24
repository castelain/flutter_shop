import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('todos')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoDetail(todo: todos[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class TodoDetail extends StatelessWidget {
  final Todo todo;
  TodoDetail({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(todo.title)),
        body: Center(
          child: Text(todo.description),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    title: 'todo app',
    home: TodoList(
      todos: List<Todo>.generate(
          20,
          (i) => Todo(
              'Todo $i', 'A description of what needs to be done for Todo $i')),
    ),
  ));
}
