import 'package:class_1/cubit_part_2/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class AddTodoPage extends StatefulWidget {
  static const name = "/add-todo-page";
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _todoTitleTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _todoTitleTEController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  todoCubit.addTodo(_todoTitleTEController.text.trim());
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
