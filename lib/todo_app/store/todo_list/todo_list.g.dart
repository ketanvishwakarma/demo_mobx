// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoList on _TodoListBase, Store {
  late final _$todoListAtom =
      Atom(name: '_TodoListBase.todoList', context: context);

  @override
  ObservableList<Todo> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<Todo> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_TodoListBase.filter', context: context);

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$_TodoListBaseActionController =
      ActionController(name: '_TodoListBase', context: context);

  @override
  void addTodo(String description) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList},
filter: ${filter}
    ''';
  }
}
