import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequestedEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final email = event.email;
        final password = event.password;

        if (password.length < 6) {
          emit(AuthFailureState('Password must be more then 6 char'));
          return;
        }

        await Future.delayed(Duration(seconds: 1), () {
          emit(AuthSuccessState(uid: '$email-$password'));
        });
      } catch (e) {
        return emit(AuthFailureState(e.toString()));
      }
    });
    on<AuthLogoutRquestedEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await Future.delayed(const Duration(seconds: 1), () {
          emit(AuthInitial());
          return;
        });
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });
  }
}
