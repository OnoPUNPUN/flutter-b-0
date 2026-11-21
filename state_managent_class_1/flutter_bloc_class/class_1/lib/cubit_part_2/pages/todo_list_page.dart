import 'package:class_1/cubit_part_2/cubit/todo_cubit.dart';
import 'package:class_1/cubit_part_2/models/todo_model.dart';
import 'package:class_1/cubit_part_2/pages/add_todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class TodoListPage extends StatelessWidget {
  static const name = "/";
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        bloc: todoCubit,
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(title: Text(todo.name));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTodoPage.name);
        },
      ),
    );
  }
}
