import 'package:flutter/material.dart';

import 'widgets/filter_todo.dart';
import 'widgets/new_todo.dart';

import 'widgets/search_todo.dart';
import 'widgets/show_todos.dart';
import 'widgets/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TodoHeader(),
              NewTodo(),
              SizedBox(height: 20),
              SearchTodo(),
              SizedBox(height: 10),
              FilterTodo(),
              SizedBox(height: 10),
              Expanded(child: ShowTodos()),
            ],
          ),
        ),
      ),
    );
  }
}