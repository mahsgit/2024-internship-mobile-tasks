 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/counterblock/counter_bloc.dart';
import 'package:testbloc/counterblock/counter_event.dart';
import 'package:testbloc/counterblock/counter_state.dart';

void main(){
  runApp(MyApp());
 }


 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterBlocPage(),
      ),


     );
   }
 }

 class CounterBlocPage extends StatefulWidget {
   const CounterBlocPage({super.key});
 
   @override
   State<CounterBlocPage> createState() => _CounterBlocPageState();
 }
 
 class _CounterBlocPageState extends State<CounterBlocPage> {
   @override
   Widget build(BuildContext context) {
     return  Scaffold(
      body:Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                    'Counter: ${state.primaryCounter}',
                    style: TextStyle(fontSize: 40),
                    ),
                    Text(
                    'Counter: ${state.secondaryCounter}',
                    style: TextStyle(fontSize: 40),
                    )
                ],

              );
               },
          ),
        
        


              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state.primaryCounter%2==0){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar
                    (content: Text("Even number: ${state.primaryCounter}")));
                  }


                },
                child: SizedBox.shrink(),
              ),
       Row(children: [
        FloatingActionButton(onPressed: 

        ()=> context.read<CounterBloc>().add(IncreamentPrimary()),
        child: const Icon(Icons.add),
        
        ),

        FloatingActionButton(onPressed: ()=>
        context.read<CounterBloc>().add(DecrementPrimary()),
        child: Icon(Icons.minimize),

        
        ),

        ElevatedButton(onPressed: ()=>
        context.read<CounterBloc>().add(ResetPrimary()),
         child: Icon(Icons.delete))


       ],)

           
        ]
       ),
        
      );

     
   }
 }