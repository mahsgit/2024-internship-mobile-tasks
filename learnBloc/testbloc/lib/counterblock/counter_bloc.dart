import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/counterblock/counter_event.dart';
import 'package:testbloc/counterblock/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc(): super(
    CounterState(
      primaryCounter: 0,
       secondaryCounter: 2))

       {
        on<IncreamentPrimary>( (event ,emit ){
          emit(CounterState
          (primaryCounter: state.primaryCounter+1,
           secondaryCounter: state. secondaryCounter));});

           on<DecrementPrimary>( (event ,emit ){
          emit(CounterState
          (primaryCounter: state.primaryCounter-1,
           secondaryCounter: state. secondaryCounter));});
          
          on<ResetPrimary>( (event ,emit ){
          emit(CounterState
          (primaryCounter: 0,
           secondaryCounter: state. secondaryCounter));});





  }



}