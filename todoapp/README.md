# todo_riverpod_sync

- Synchrnous Todo

[684b6b7 (커밋 링크)](https://github.com/southglory/riverpod_study/tree/684b6b7da1338fa9420fbef0c8c82579a11c4ead/todoapp)

지금까지의 커밋들을 종합적으로 분석했을 때 **앱의 아쉬운 점**과 개선할 수 있는 부분은 다음과 같습니다.

---

### 🚩 **1. 상태 관리의 단순화 부족**
- **문제**:  
   - 여러 상태(할 일 목록, 필터, 검색어, 테마 등)를 각각 개별 Provider로 관리하고 있음.  
   - 상태 간 결합이나 복합 로직이 추가될 경우 복잡도가 증가할 수 있습니다.  
- **개선 방향**:  
   - **`StateNotifier`** 나 **`Notifier`** 를 사용하여 복합 상태(예: `TodoState`)를 한곳에 통합 관리하는 방법을 고려.  
   - 예를 들어, 할 일 목록과 필터링, 검색 기능을 하나의 상태 클래스에 포함하여 리팩토링할 수 있습니다.

---

### 🚩 **2. UI 디자인의 부족한 일관성**
- **문제**:  
   - 테마 전환 기능이 추가되었지만, 다크 모드와 라이트 모드에서의 색상, 아이콘, 텍스트 스타일이 최적화되지 않았습니다.  
   - 디자인의 일관성이나 사용자 경험(UX) 측면에서 개선이 필요합니다.  
- **개선 방향**:  
   - **Custom ThemeData**를 만들어 색상 팔레트와 위젯 스타일을 일관되게 설정.  
   - 테마에 따라 아이콘, 배경색, 텍스트 색상이 동적으로 변경되도록 추가 설정.  
   - UI 라이브러리(예: Flutter의 `ThemeExtension`)를 적극 활용.

---

### 🚩 **3. 중복 코드의 존재**
- **문제**:  
   - `ListView`나 `TextField`처럼 일부 UI 요소들이 반복적으로 사용되고 있음.  
   - 예를 들어 `ShowTodos`, `SearchTodo`, `FilterTodo` 등 각 위젯이 개별적으로 구성되어 있어 중복 코드가 발생할 여지가 있습니다.  
- **개선 방향**:  
   - 공통 UI 위젯이나 유틸리티 함수를 만들어 코드 재사용성을 높일 수 있습니다.  
     예: `CustomTextField`와 같은 재사용 가능한 위젯을 정의.  
   - ProviderScope의 **상태 주입**을 더욱 효율적으로 리팩토링.

---

### 🚩 **4. 사용자 상호작용과 피드백 부족**
- **문제**:  
   - 기능(할 일 추가, 삭제, 수정, 테마 변경 등)은 잘 구현되었지만, **사용자 피드백**이 부족합니다.  
   - 예를 들어:  
     - 할 일 항목 삭제 시 간단한 애니메이션이나 **스낵바** 알림이 없음.  
     - 테마 변경 시 화면 전환이 즉시 반영되지만 시각적 피드백이 약함.  
- **개선 방향**:  
   - **애니메이션**과 **시각적 효과**를 추가해 사용자 경험을 개선.  
   - `Flutter's SnackBar`, `AnimatedList`, `Hero` 위젯 등을 활용하여 부드러운 UX 제공.

---

### 🚩 **5. 디바이스 및 네트워크 대응 부족**
- **문제**:  
   - 현재 앱은 **로컬 상태**에서만 작동합니다.  
   - 네트워크 상태가 추가될 경우 확장성이 부족하며, 디바이스 크기에 따른 반응형 레이아웃 대응이 명확하지 않습니다.  
- **개선 방향**:  
   - **백엔드 연동**: 할 일 목록을 네트워크에서 가져오고 저장하는 API와 연결.  
   - **반응형 UI**: `MediaQuery`나 `LayoutBuilder`를 활용하여 다양한 화면 크기에서도 최적화된 레이아웃을 제공.  

---

### 🚩 **6. 테스트 코드 부족**
- **문제**:  
   - 기능 구현은 잘 되어 있으나, 단위 테스트나 위젯 테스트 코드가 없습니다.  
   - 기능 추가 또는 수정 시 부작용이 발생할 가능성이 높습니다.  
- **개선 방향**:  
   - **단위 테스트**: `flutter_test`를 사용해 Provider의 상태와 로직 검증.  
   - **위젯 테스트**: UI 위젯의 동작을 테스트해 사용자 상호작용을 검증.

---

### ✨ **종합 개선 방향**  
1. **상태 리팩토링**: 상태를 통합 관리하고 복잡도를 줄이기.  
2. **UI 일관성**: 테마 및 디자인 요소를 일관되게 개선.  
3. **재사용성 강화**: 중복 코드를 줄이고 공통 위젯을 생성.  
4. **UX 향상**: 사용자 피드백을 제공하는 애니메이션과 시각적 효과 추가.  
5. **확장성**: 네트워크 연동 및 반응형 디자인 대응.  
6. **테스트 추가**: 단위 테스트 및 UI 테스트를 도입하여 앱의 안정성을 확보.

---

**현재 구현된 기능은 매우 구조적이고 깔끔하지만, 사용자 경험과 코드 재사용성, 테스트 측면에서 약간의 개선이 필요합니다.**


---
### ✨ **추가 개선 방향**  
### 혹시, 데이터 중심 설계 관점에서 볼 때, 데이터가 과도하게 ui의 상태와 엮여있거나 하지는 않은가?

---

데이터 중심 설계 관점에서 지금까지의 코드와 커밋을 살펴보면 **데이터와 UI 상태가 과도하게 엮여 있는 부분**이 일부 발견될 수 있습니다. 이는 유지보수성과 확장성을 저해할 수 있는 요소입니다.

---

### **데이터와 UI 상태의 결합 현황**  
1. **데이터 모델과 UI 직접 사용**  
   - `TodoItem`과 같은 위젯에서 **Todo 데이터 모델**을 직접 사용하고 있습니다.  
   - 예시:  
     ```dart
     return ListTile(
       title: Text(todo.desc),
       ...
     );
     ```  
   - 이렇게 UI에서 모델을 직접 사용하면 UI가 데이터의 구조에 강하게 의존하게 됩니다.  

2. **데이터 상태와 UI 로직 결합**  
   - `todoListProvider`, `todoFilterProvider`, `todoSearchProvider` 등 **상태 관리**가 Provider를 통해 잘 나눠져 있지만,  
     **UI 위젯 내부에서 이 상태를 직접 구독하고 조작**합니다.  
   - 예시:  
     ```dart
     final todos = ref.watch(todoListProvider);
     final filter = ref.watch(todoFilterProvider);
     final search = ref.watch(todoSearchProvider);
     ```  
   - 이렇게 UI와 상태 관리가 밀접하게 엮이면 **재사용성**이 떨어지고, 상태 변화에 따라 UI 로직이 불필요하게 복잡해질 수 있습니다.

3. **ProviderScope의 세부 주입**  
   - `ShowTodos`에서 `ProviderScope`를 통해 `todoItemProvider`를 세부적으로 override하고 있습니다.  
   - 이는 데이터 상태를 UI 위젯과 밀접하게 엮어놓는 대표적인 예시입니다.  

---

### **문제가 되는 이유**  
- **재사용성 저하**: UI가 데이터 모델에 의존하면 모델이 변경될 때 UI까지 수정해야 합니다.  
- **유지보수 복잡성**: 데이터의 로직과 UI 로직이 분리되지 않아 수정 사항이 여러 파일에 퍼질 수 있습니다.  
- **확장성 부족**: 데이터나 상태 관리 방식을 바꾸려면 UI 로직도 함께 리팩토링해야 합니다.  

---

### **개선 방향**  

1. **ViewModel 또는 중간 계층 도입**  
   - 데이터와 UI 상태를 분리하기 위해 **ViewModel**이나 중간 계층을 도입합니다.  
   - 예시 구조:  
     - **`TodoViewModel`**: 데이터를 가공하고 UI 상태를 제공.  
     - **UI**는 ViewModel에서 제공하는 상태를 구독합니다.  

   **예시**:
   ```dart
   class TodoViewModel {
     final List<Todo> todos;
     TodoViewModel({required this.todos});

     List<Todo> get activeTodos => todos.where((todo) => !todo.completed).toList();
   }
   ```

   UI 위젯은 ViewModel만 구독:
   ```dart
   final viewModel = TodoViewModel(todos: ref.watch(todoListProvider));
   ```

---

2. **상태 가공은 Provider 단에서 처리**  
   - 현재 `filteredTodosProvider`에서 필터링과 검색을 동시에 수행합니다.  
   - 상태 가공 로직이 많아지면 Provider가 복잡해지므로 **별도의 상태 가공 Provider**로 분리하는 것이 좋습니다.  

   **예시**:
   ```dart
   final activeTodosProvider = Provider((ref) {
     final todos = ref.watch(todoListProvider);
     return todos.where((todo) => !todo.completed).toList();
   });
   ```

---

3. **UI와 상태의 의존성 최소화**  
   - UI는 오직 상태를 **읽기**만 하고, 상태 조작은 **ViewModel**이나 Provider 내부에서만 처리해야 합니다.  
   - UI 코드에서 `ref.read`를 직접 호출하지 않고 콜백 함수나 ViewModel을 통해 상태를 변경합니다.

   **개선된 UI 예시**:
   ```dart
   Consumer(builder: (context, ref, _) {
     final todos = ref.watch(filteredTodosProvider);
     return ListView.builder(
       itemCount: todos.length,
       itemBuilder: (context, index) => TodoItem(todo: todos[index]),
     );
   });
   ```

---

### **결론**  
현재 상태 관리와 UI는 잘 설계되었지만 **데이터와 UI 상태의 결합이 느슨하지 않은 부분**이 보입니다. 이를 개선하려면:  

1. **ViewModel**을 도입해 UI와 상태 로직을 분리하고,  
2. 상태 가공은 Provider 또는 별도 계층에서 처리하며,  
3. UI에서 상태를 조작하지 않고 읽기 전용으로 사용하도록 리팩토링하는 것이 필요합니다.  

이렇게 하면 **유지보수성**과 **확장성**이 크게 개선될 것입니다.

---
### ✨ **추가 개선 방향**  
### 그런데 provider가 이렇게 많은게 좋아?

---

Provider가 많은 것은 프로젝트의 구조와 요구사항에 따라 **장단점**이 있습니다. 아래에 **Provider가 많을 때의 문제점**과 이를 **개선하는 방법**을 설명하겠습니다.

---

### **Provider가 많은 경우의 문제점**

1. **코드 복잡성 증가**
   - Provider가 많아질수록 코드의 복잡도가 높아지고, 관리하기 어려워질 수 있습니다.
   - 서로 연관된 상태가 분리된 Provider로 관리되면, 상태 간의 의존성을 추적하기가 까다로워집니다.

2. **상태 관리의 분산**
   - 상태가 여러 Provider에 분산되면, 상태 간의 관계를 이해하거나 디버깅하기 어렵습니다.
   - 예를 들어, `todoFilterProvider`, `todoSearchProvider`, `todoListProvider`가 서로 관련된 상태를 관리하지만, 각각 개별적으로 관리되어 복잡도가 증가합니다.

3. **테스트 및 유지보수 어려움**
   - 각각의 Provider가 독립적으로 테스트 가능해야 하지만, 서로 의존하는 Provider가 많으면 테스트가 복잡해질 수 있습니다.
   - 새로운 기능을 추가할 때 관련된 여러 Provider를 수정해야 할 수도 있습니다.

4. **성능 문제**
   - Provider가 많아질수록, 불필요하게 많은 위젯이 재빌드될 가능성이 커집니다.

---

### **Provider 분리의 장점**
- **단일 책임 원칙(Single Responsibility Principle)**:  
  - 각 Provider가 하나의 상태만 관리하므로 역할이 명확합니다.
- **재사용성 증가**:  
  - 특정 상태가 여러 화면에서 필요할 때 해당 Provider를 쉽게 재사용할 수 있습니다.
- **의존성 주입**:  
  - 필요한 상태를 정확히 주입하여, UI 위젯이 의존하는 데이터를 명확히 설정할 수 있습니다.

---

### **Provider를 줄이는 방법**

1. **StateNotifier로 복합 상태 관리**
   - 여러 개의 Provider 대신 하나의 `StateNotifier`나 `Notifier`를 사용해 **복합 상태**를 관리합니다.
   - 예: `TodoListState`라는 하나의 상태를 만들어, 필터링, 검색어, 할 일 목록을 모두 포함.

   **예시 코드**:
   ```dart
   import 'package:riverpod/riverpod.dart';
   import '../models/todo_model.dart';

   class TodoListState {
     final List<Todo> todos;
     final Filter filter;
     final String searchTerm;

     TodoListState({
       required this.todos,
       required this.filter,
       required this.searchTerm,
     });

     TodoListState copyWith({
       List<Todo>? todos,
       Filter? filter,
       String? searchTerm,
     }) {
       return TodoListState(
         todos: todos ?? this.todos,
         filter: filter ?? this.filter,
         searchTerm: searchTerm ?? this.searchTerm,
       );
     }
   }

   class TodoListNotifier extends StateNotifier<TodoListState> {
     TodoListNotifier() : super(TodoListState(todos: [], filter: Filter.all, searchTerm: ''));

     void addTodo(String desc) {
       state = state.copyWith(todos: [...state.todos, Todo.add(desc: desc)]);
     }

     void toggleTodo(String id) {
       state = state.copyWith(
         todos: state.todos.map((todo) {
           if (todo.id == id) {
             return todo.copyWith(completed: !todo.completed);
           }
           return todo;
         }).toList(),
       );
     }

     void setFilter(Filter newFilter) {
       state = state.copyWith(filter: newFilter);
     }

     void setSearchTerm(String searchTerm) {
       state = state.copyWith(searchTerm: searchTerm);
     }

     List<Todo> get filteredTodos {
       var filtered = state.todos;
       if (state.filter == Filter.active) {
         filtered = filtered.where((todo) => !todo.completed).toList();
       } else if (state.filter == Filter.completed) {
         filtered = filtered.where((todo) => todo.completed).toList();
       }
       if (state.searchTerm.isNotEmpty) {
         filtered = filtered.where((todo) => todo.desc.toLowerCase().contains(state.searchTerm.toLowerCase())).toList();
       }
       return filtered;
     }
   }

   final todoListProvider = StateNotifierProvider<TodoListNotifier, TodoListState>((ref) {
     return TodoListNotifier();
   });
   ```

2. **별도의 ViewModel 또는 Service 도입**
   - **ViewModel**: UI 로직을 분리하여 Provider에서 직접 상태를 관리하지 않도록 리팩토링.
   - **Service**: 데이터 로직을 Service 계층으로 옮겨 Provider는 Service의 데이터를 주입만 담당.

3. **의존성 연결**
   - 여러 Provider가 서로 독립적으로 동작하지 않고 서로 의존성을 갖는 경우, 필요한 상태를 Provider 내부에서 처리하도록 변경.
   - 예: `filteredTodosProvider`를 `todoListProvider`의 상태를 구독하여 내부에서 필터링과 검색을 처리.

---

### **Provider를 줄이는 설계 예시**

- 기존 설계:
  - `todoListProvider`: 할 일 목록
  - `todoFilterProvider`: 필터
  - `todoSearchProvider`: 검색어
  - `filteredTodosProvider`: 필터링된 목록

- 개선 설계:
  - `todoListProvider`: **하나의 Provider로 모든 상태를 관리**
    - 할 일 목록, 필터, 검색어를 포함한 상태.
    - 필터링과 검색은 상태 내부에서 처리.
  - UI 위젯은 이 Provider를 구독하여 필요한 상태를 가져오고 사용.

---

### **결론**

Provider의 개수는 적절한 수준을 유지해야 하며, **단순성과 가독성, 유지보수성**이 중요합니다. 현재처럼 여러 Provider가 있는 경우:  
1. Provider를 통합 관리하는 구조(StateNotifier 사용).  
2. UI와 데이터 로직을 분리하여 Provider의 역할을 명확히.  

이렇게 개선하면 상태 관리가 단순화되고, 코드베이스의 유지보수성이 향상될 것입니다. 😊


---
### ✨ **추가 개선 방향**  
### 그런데 provider는 상태관리를 목적으로 하는 클래스이므로, ui와 무관하게 하려면 provider 바깥에서 로직이 흘러가야 하는거 아니야?

---
맞습니다. **Provider는 상태 관리를 목적으로 하는 클래스**이기 때문에, **UI와 무관하게 작동하도록 설계**하는 것이 바람직합니다.  
Provider 내부에서 **UI 로직**이 아닌 **데이터 관리**만 책임지고, UI와는 분리된 역할을 가져야 합니다. 이를 위해 다음과 같은 원칙과 구조를 적용할 수 있습니다.

---

## **Provider와 UI를 분리하는 올바른 설계**

### **1. Provider는 데이터와 상태만 관리**
- **Provider는 데이터의 상태를 관리하고, 변경 작업을 처리**해야 합니다.  
- UI에서 Provider의 상태를 읽거나 변경 요청을 할 수는 있지만, **Provider가 UI에 대해 알 필요는 없습니다.**

---

### **2. UI 로직은 Provider 바깥에서 처리**
UI와 관련된 로직(예: 사용자 입력 검증, 다이얼로그 표시, 애니메이션 등)은 Provider 바깥에서 처리되어야 합니다. Provider는 상태 변경 요청을 받아들이는 "데이터 관리 계층" 역할만 합니다.

---

### **3. 데이터 흐름 분리**
- UI는 Provider에게 상태 변경 요청만 보냅니다.
- Provider는 요청을 처리하고, 상태를 업데이트합니다.
- UI는 Provider에서 변경된 상태를 구독하고, 필요할 경우 이를 렌더링합니다.

---

## **구조적인 설계 예시**

### **1. TodoListProvider**
Provider는 상태 관리와 로직만 처리하며 UI와 독립적입니다.

**lib/providers/todo_list_provider.dart**
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/todo_model.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  List<Todo> build() {
    return [
      const Todo(id: '1', desc: 'Clean the room'),
      const Todo(id: '2', desc: 'Do homework'),
    ];
  }

  void addTodo(String desc) {
    state = [...state, Todo.add(desc: desc)];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(completed: !todo.completed);
      }
      return todo;
    }).toList();
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
```

---

### **2. UI에서 Provider 호출**
UI는 Provider의 상태를 읽거나 변경 요청을 보낼 뿐, Provider 내부 로직을 알지 못합니다.

**lib/widgets/todo_item.dart**
```dart
import 'package:flutter/material.dart';
import '../../../models/todo_model.dart';

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
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) => onToggle(),
      ),
      title: Text(todo.desc),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
```

---

### **3. ShowTodos에서 상태 관리**
UI에서 상태를 읽고, 필요한 작업을 Provider에 요청합니다.

**lib/widgets/show_todos.dart**
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_list_provider.dart';
import 'todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListNotifierProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onToggle: () => ref.read(todoListNotifierProvider.notifier).toggleTodo(todo.id),
          onDelete: () => ref.read(todoListNotifierProvider.notifier).removeTodo(todo.id),
        );
      },
    );
  }
}
```

---

### **4. 사용자 입력과 Provider 연동**
사용자 입력은 UI에서 처리하며, 검증 후 Provider에 전달합니다.

**lib/widgets/add_todo_dialog.dart**
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_list_provider.dart';

class AddTodoDialog extends ConsumerStatefulWidget {
  const AddTodoDialog({super.key});

  @override
  ConsumerState<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends ConsumerState<AddTodoDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter your todo'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            final desc = _controller.text.trim();
            if (desc.isNotEmpty) {
              ref.read(todoListNotifierProvider.notifier).addTodo(desc);
              Navigator.pop(context);
            }
          },
          child: const Text('ADD'),
        ),
      ],
    );
  }
}
```

---

## **Provider와 UI 분리의 효과**
1. **역할 분리**:  
   - Provider는 상태 관리와 로직만 처리하고, UI는 Provider의 상태를 읽고 렌더링하는 역할만 합니다.
   
2. **테스트 가능성 증가**:  
   - Provider가 UI와 독립적이므로, 상태 관리 로직을 쉽게 단위 테스트할 수 있습니다.

3. **유지보수성 향상**:  
   - UI와 상태 관리 로직이 분리되어 한쪽을 수정해도 다른 쪽에 영향을 미치지 않습니다.

---

## **결론**
Provider는 UI와 독립적으로 상태를 관리해야 하며, UI는 Provider에 상태 변경 요청만 하고, 상태를 구독하는 역할만 해야 합니다.  
이를 위해:
- **Provider는 데이터와 로직만 관리**.  
- **UI는 Provider의 상태를 읽거나 요청**.  
- **사용자 입력 및 UI 로직은 UI 계층에서 처리**.  

이렇게 구조를 개선하면 **확장성, 테스트 가능성, 유지보수성**이 모두 향상됩니다! 😊