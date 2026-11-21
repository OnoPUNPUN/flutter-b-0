import 'package:class_1/bloc_part_1/bloc/couter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CouterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementedEvent());
            },
            heroTag: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementedEvent());
            },
            heroTag: 'Decrement',
            child: const Icon(Icons.minimize),
          ),

          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterResetEvent());
            },
            heroTag: 'Reset',
            child: const Icon(Icons.reset_tv),
          ),
        ],
      ),
    );
  }
}
