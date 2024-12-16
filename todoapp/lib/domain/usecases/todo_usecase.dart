import '../models/todo_model.dart';

class TodoUseCase {
  List<Todo> addTodo(List<Todo> todos, String desc) {
    return [...todos, Todo.add(desc: desc)];
  }

  List<Todo> editTodo(List<Todo> todos, String id, String desc) {
    return [
      for (final todo in todos)
        if (todo.id == id) todo.copyWith(desc: desc) else todo
    ];
  }

  List<Todo> toggleTodo(List<Todo> todos, String id) {
    return [
      for (final todo in todos)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
    ];
  }

  List<Todo> removeTodo(List<Todo> todos, String id) {
    return [
      for (final todo in todos)
        if (todo.id != id) todo
    ];
  }

  List<Todo> filterTodos(List<Todo> todos, Filter filter, String search) {
    List<Todo> filtered = switch (filter) {
      Filter.active => todos.where((todo) => !todo.completed).toList(),
      Filter.completed => todos.where((todo) => todo.completed).toList(),
      Filter.all => todos,
    };

    if (search.isNotEmpty) {
      filtered = filtered
          .where((todo) => 
              todo.desc.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    return filtered;
  }
} 