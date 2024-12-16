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