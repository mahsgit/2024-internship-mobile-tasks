import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/login_and_registration/presentation/bloc/user+bloc.dart';
import 'features/login_and_registration/presentation/page/signin.dart';
import 'features/login_and_registration/presentation/page/signup.dart';
import 'features/login_and_registration/presentation/page/splash.dart';
import 'features/product/presentation/bloc/addbloc/add_bloc.dart';
import 'features/product/presentation/bloc/homebloc/home_block.dart';
import 'features/product/presentation/bloc/homebloc/home_event.dart';
import 'features/product/presentation/bloc/search_bloc/search_bloc.dart';
import 'features/product/presentation/pages/crudpage.dart';
import 'features/product/presentation/pages/home.dart';
import 'features/product/presentation/pages/search.dart';
import 'core/DI.dart';

void main() async {
  // if dependecy or asynchrones event ......
  // are in our code we have to initialize by telling flutter befor run the app
  WidgetsFlutterBinding.ensureInitialized();
  // onet time setup i initialized it in DI.dart
  await setup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        // create widgets contex and pass to it children this case myapp so myapp can
        //access to the context of all bloc through produvider widget
        // it will get homblock instance from getit and
        // add or call fetchdata event from the homeblock

        create: (context) => getIt.get<HomeBlock>()..add(FetchData()),
      ),
      BlocProvider(
        create: (context) => getIt.get<AddBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt.get<UpdateBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt.get<DeleteBloc>(),
      ),
      BlocProvider(create: (context) => getIt.get<SighUpBloc>()),
      BlocProvider(create: (context) => getIt.get<SignInBloc>()),
      BlocProvider(
        create: (context) => SearchBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/': (context) => RootApp(),
        '/search': (context) => const Search(),
        '/crudepage': (context) => const Crudpage(),
        '/signup': (context) => const Signup(),
        '/signin': (context) => const Signin(),
        '/splash': (context) => const Splash(),
      },
    );
  }
}
