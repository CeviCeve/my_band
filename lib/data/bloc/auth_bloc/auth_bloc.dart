import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_band/data/dto_pattern/dto/web_dto.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final WebDto webDto = WebDto();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<AuthToReg>((event, emit) async {
      emit(AuthLoading());
      try {
        await webDto.registration(
          name: event.name,
          email: event.email,
          password: event.password,
          passwordConfirm: event.password,
          dob: event.dob,
          userCode: event.email.hashCode.toString(),
        );
      } catch (e) {
        emit(AuthError(errorMessage: "ошибка при регистрации"));
      }
    });

    on<AuthToLogin>((event, emit) {
      emit(AuthLoading());
    });
  }
}
