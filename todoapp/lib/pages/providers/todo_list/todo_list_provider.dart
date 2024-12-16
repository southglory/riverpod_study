import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/todo_model.dart';
import '../../../domain/usecases/todo_usecase.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  late final TodoUseCase _todoUseCase = TodoUseCase();

  @override
  List<Todo> build() {
    return [
      const Todo(id: '1', desc: 'Clean the room'),
      const Todo(id: '2', desc: 'Wash the dishes'),
      const Todo(id: '3', desc: 'Do homework'),
    ];
  }

  void addTodo(String desc) {
    state = _todoUseCase.addTodo(state, desc);
  }

  void editTodo(String id, String desc) {
    state = _todoUseCase.editTodo(state, id, desc);
  }

  void toggleTodo(String id) {
    state = _todoUseCase.toggleTodo(state, id);
  }

  void removeTodo(String id) {
    state = _todoUseCase.removeTodo(state, id);
  }
}
