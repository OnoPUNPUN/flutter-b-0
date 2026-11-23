import 'package:class_1/login_form/bloc/auth_bloc.dart';
import 'package:class_1/login_form/pages/login_screen.dart';
import 'package:class_1/login_form/widgets/gradient_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState =
        BlocProvider.of<AuthBloc>(context).state as AuthSuccessState;
    //final authState = context.watch<AuthBloc>().state as AuthSuccessState;

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (routes) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(authState.uid),
                SizedBox(height: 10),
                GradientButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogoutRquestedEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
