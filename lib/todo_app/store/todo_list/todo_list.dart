import 'package:demo_mobx/todo_app/store/todo/todo.dart';
import 'package:mobx/mobx.dart';
part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

class TodoList = _TodoListBase with _$TodoList;

abstract class _TodoListBase with Store {
  @observable
  ObservableList<Todo> todoList = ObservableList.of([
    Todo('Todo with MobX'),
    Todo('Read book'),
    Todo('Make YouTube video'),
  ]);

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<Todo> get completedTodoList =>
      ObservableList.of(todoList.where((todo) => todo.isDone));

  @computed
  ObservableList<Todo> get pendingTodoList =>
      ObservableList.of(todoList.where((todo) => !todo.isDone));

  @computed
  ObservableList<Todo> get visibleTodoList {
    switch (filter) {
      case VisibilityFilter.completed:
        return completedTodoList;
      case VisibilityFilter.pending:
        return pendingTodoList;
      default:
        return todoList;
    }
  }

  @action
  void addTodo(String description) {
    final todo = Todo(description);
    todoList.add(todo);
  }

  @action
  void removeTodo(Todo todo) =>
      todoList.removeWhere((element) => element == todo);

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;
}
