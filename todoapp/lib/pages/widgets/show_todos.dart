import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_list/todo_list_provider.dart';
import '../viewmodels/todo_view_model.dart';
import 'todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(todoViewModelProvider);

    return ListView.separated(
      itemCount: filteredTodos.length,
      separatorBuilder: (context, _) => const Divider(color: Colors.grey),
      itemBuilder: (context, index) {
        final todo = filteredTodos[index];
        return TodoItem(
          todo: todo,
          onToggle: () => ref.read(todoListProvider.notifier).toggleTodo(todo.id),
          onDelete: () => ref.read(todoListProvider.notifier).removeTodo(todo.id),
        );
      },
    );
  }
}
