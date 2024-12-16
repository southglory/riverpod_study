import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/todo_model.dart';
import '../providers/todo_list/todo_list_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ConfirmEditDialog(todo: todo),
        );
      },
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) => onToggle(),
      ),
      title: Text(todo.desc),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          // 삭제 확인 다이얼로그
          final removeOrNot = await showDialog<bool>(
            context: context,
            barrierDismissible: false, // 바깥 클릭으로 닫히지 않게 설정
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you really want to delete?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false), // 취소 선택 시 false 반환
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true), // 확인 선택 시 true 반환
                    child: const Text('Yes'),
                  ),
                ],
              );
            },
          );

          // 사용자가 삭제를 확인했을 때만 삭제 처리
          if (removeOrNot == true) {
            onDelete();
          }
        },
      ),
    );
  }
}

class ConfirmEditDialog extends ConsumerStatefulWidget {
  final Todo todo;
  const ConfirmEditDialog({super.key, required this.todo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends ConsumerState<ConfirmEditDialog> {
  late final TextEditingController textController;
  bool error = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.todo.desc);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: TextField(
        controller: textController,
        autofocus: true,
        decoration: InputDecoration(
          errorText: error ? 'Value cannot be empty' : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            error = textController.text.isEmpty ? true : false;
            if (error) {
              setState(() {});
            } else {
              ref.read(todoListNotifierProvider.notifier).editTodo(
                    widget.todo.id,
                    textController.text,
                  );
              Navigator.pop(context);
            }
          },
          child: const Text('EDIT'),
        ),
      ],
    );
  }
}
