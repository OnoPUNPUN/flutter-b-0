import 'package:class_1/login_form/bloc/auth_bloc.dart';
import 'package:class_1/login_form/core/theme/app_colors.dart';
import 'package:class_1/login_form/pages/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
