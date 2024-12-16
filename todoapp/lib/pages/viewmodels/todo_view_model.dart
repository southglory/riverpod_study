import '../providers/todo_list/todo_list_provider.dart';
import '../providers/todo_filter/todo_filter_provider.dart';
import '../providers/todo_search/todo_search_provider.dart';
import '../../../models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_view_model.g.dart';

@riverpod
class TodoViewModel extends _$TodoViewModel {
  @override
  List<Todo> build() {
    final todos = ref.watch(todoListNotifierProvider);
    final filter = ref.watch(todoFilterProvider);
    final search = ref.watch(todoSearchProvider);

    return _applyFilterAndSearch(todos, filter, search);
  }

  List<Todo> _applyFilterAndSearch(List<Todo> todos, Filter filter, String search) {
    List<Todo> filtered = switch (filter) {
      Filter.active => todos.where((todo) => !todo.completed).toList(),
      Filter.completed => todos.where((todo) => todo.completed).toList(),
      Filter.all => todos,
    };

    if (search.isNotEmpty) {
      filtered = filtered.where((todo) => todo.desc.toLowerCase().contains(search.toLowerCase())).toList();
    }

    return filtered;
  }
}
