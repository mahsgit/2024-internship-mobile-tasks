import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../product/presentation/bloc/search_bloc/search_bloc_state.dart';
import '../../domain/entities/userEntity.dart';
import '../../domain/usecases/signupusecase.dart';
import 'user_bloc_event.dart';
import 'user_bloc_state.dart';

class SighUpBloc extends Bloc<UserBlocEvent,UserBlocState>{
  Signupusecase   signupusecase;
  SighUpBloc({required this.signupusecase}):super(UserInitial()){
    on<Signupevent>((event, emit) async{
      try{
        final user= Userentity(
          id: " ", 
        email: event.email,
         name: event.name, 
         password: event.password,
         );
         final result =await signupusecase(user);
        result.fold(
          (failure)=>emit(UserFailure(failure.message)),
          (user)=>emit(UserSuccess(user)),
        );

      }catch(e){
        emit(UserFailure("Failed to add user"));
      }
    }

    );


on<InitialEvent>((event, emit) async {
      emit(UserInitial());
    });


  }
}