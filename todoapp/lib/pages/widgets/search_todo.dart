import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/debounce.dart';
import '../providers/todo_search/todo_search_provider.dart';

class SearchTodo extends ConsumerStatefulWidget {
  const SearchTodo({super.key});

  @override
  ConsumerState<SearchTodo> createState() => _SearchTodoState();
}

class _SearchTodoState extends ConsumerState<SearchTodo> {
  final debounce = Debounce(milliseconds: 1000);

  @override
  void dispose() {
    debounce.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search todos...',
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (String? newSearchTerm) {
        if (newSearchTerm != null) {
          debounce.run(() {
            ref.read(todoSearchProvider.notifier).setSearchTerm(newSearchTerm);
          });
        }
      },
    );
  }
}