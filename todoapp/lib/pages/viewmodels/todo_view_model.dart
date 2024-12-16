import '../providers/todo_list/todo_list_provider.dart';
import '../providers/todo_filter/todo_filter_provider.dart';
import '../providers/todo_search/todo_search_provider.dart';
import '../../../domain/models/todo_model.dart';
import '../../../domain/usecases/todo_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_view_model.g.dart';

@riverpod
class TodoViewModel extends _$TodoViewModel {
  late final TodoUseCase _todoUseCase = TodoUseCase();

  @override
  List<Todo> build() {
    final todos = ref.watch(todoListNotifierProvider);
    final filter = ref.watch(todoFilterProvider);
    final search = ref.watch(todoSearchProvider);

    return _todoUseCase.filterTodos(todos, filter, search);
  }
}
