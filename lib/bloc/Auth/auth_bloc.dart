import 'package:bloc/bloc.dart';
import 'package:ws2/models/register_model.dart';
import 'package:ws2/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final AuthRepository _authRepo = AuthRepository();
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var response = await _authRepo.regitserRepository(event.registerModel);

        response
            ? emit(AuthSuccess())
            : emit(AuthEror(erorText: "Register faild [auth_bloc]"));
      } catch (eror) {}
    });
  }
}
