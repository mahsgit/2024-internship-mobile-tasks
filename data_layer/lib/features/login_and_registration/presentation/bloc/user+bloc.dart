import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../core/error/failures.dart';
import '../../../product/presentation/bloc/search_bloc/search_bloc_state.dart';
import '../../domain/entities/userEntity.dart';
import '../../domain/usecases/gettokenusecase.dart';
import '../../domain/usecases/signinusecase.dart';
import '../../domain/usecases/signupusecase.dart';
import 'user_bloc_event.dart';
import 'user_bloc_state.dart';

class SighUpBloc extends Bloc<UserBlocEvent, UserBlocState> {
  Signupusecase signupusecase;
  SighUpBloc({required this.signupusecase}) : super(UserInitial()) {
    on<Signupevent>((event, emit) async {
      try {
        final user = Userentity(
          email: event.email,
          name: event.name,
          password: event.password,
        );
        final result = await signupusecase(user);
        result.fold(
          (failure) => emit(UserFailure(failure.message)),
          (user) => emit(UserSuccess(user)),
        );
      } catch (e) {
        emit(UserFailure("Failed to add user"));
      }
    });
  }
}

class SignInBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final SigninUsecase signinusecase;
  GetmeBloc getmeBloc;
  SignInBloc({required this.signinusecase, required this.getmeBloc}) : super(UserInitial()) {
    on<Signinevent>((event, emit) async {
      try {
        final user = SigninParams(
          email: event.email,
          password: event.password,
        );
        final result = await signinusecase(user);
        result.fold(
          (failure) => emit(UserFailure(failure.message)),
          (token) {emit(UserSuccesslogin(token));
        getmeBloc.add(GetmeEvent(token: token));}
        );

      } catch (e) {
        emit(UserFailure("Failed to add user"));
      }
    });
  }
}

class GetmeBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final GetUserEntityUseCase getUserEntityUseCase;
  GetmeBloc({required this.getUserEntityUseCase}) : super(UserInitial()) {
    on<GetmeEvent>((event, emit) async {
      try {
        final result = await getUserEntityUseCase(event.token);
        result.fold(
          (failure) => emit(UserFailure(failure.message)),
          (user) => emit(UserLogged (user)),
        );
      } catch (e) {
        emit(UserFailure("User not Logged"));
      }
    });
  }
}
