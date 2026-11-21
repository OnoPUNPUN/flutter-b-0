import 'package:class_1/cubit_part_2/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(name: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print('TodoCubit - $change');
  }
}
