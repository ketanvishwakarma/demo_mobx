import 'package:demo_mobx/todo_app/store/todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: TodoHomeScreen(),
    );
  }
}

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<TodoList>(
      create: (_) => TodoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              TodoFilterWidget(),
              AddTodoField(),
              TodoListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoFilterWidget extends StatelessWidget {
  const TodoFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListStore = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) {
        return DropdownButton(
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem(
              value: filter,
              child: Text(filter.name),
            );
          }).toList(),
          value: todoListStore.filter,
          onChanged: (newFilter) {
            if (newFilter != null) {
              todoListStore.changeFilter(newFilter);
            }
          },
        );
      },
    );
  }
}

class AddTodoField extends StatelessWidget {
  const AddTodoField({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListStore = Provider.of<TodoList>(context);
    final controller = TextEditingController();
    return TextField(
      controller: controller,
      onSubmitted: (desc) {
        todoListStore.addTodo(desc.trim());
        controller.clear();
      },
    );
  }
}

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListStore = Provider.of<TodoList>(context);
    return Observer(builder: (_) {
      final list = todoListStore.visibleTodoList;
      return Flexible(
        child: ListView.builder(
          itemCount: list.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final todo = list.elementAt(index);
            return Observer(builder: (_) {
              return CheckboxListTile(
                title: Text(todo.description),
                value: todo.isDone,
                onChanged: (value) => todo.isDone = value ?? false,
              );
            });
          },
        ),
      );
    });
  }
}
