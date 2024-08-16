import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'features/product/presentation/bloc/addbloc/add_bloc.dart';
import 'features/product/presentation/bloc/homebloc/home_block.dart';
import 'features/product/presentation/bloc/homebloc/home_event.dart';
import 'features/product/presentation/bloc/homebloc/home_state.dart';
import 'features/product/presentation/bloc/search_bloc/search_bloc.dart';
import 'features/product/presentation/bloc/search_bloc/search_bloc_event.dart';
import 'features/product/presentation/pages/crudpage.dart';
import 'features/product/presentation/pages/search.dart';
import 'features/product/presentation/widgets/popups.dart';
import 'features/product/presentation/widgets/productcard.dart';
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
  // context is like mapp where flutter seach widget in widget try and check if it can use its context
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RootApp(),
        '/search': (context) => const Search(),
        '/crudepage': (context) => const Crudpage(),
      },
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  //build is like build the ui here using the context as search widget
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // round the child like image , container ... with circular boarder ==ClipRRect
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 210, 208, 208),
                ),
              ),
              SizedBox(width: 10),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "July 14, 2023",
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                      Text(
                        "Hello, Yohannes",
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 30),
              width: 35,
              height: 35,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    showPopup(context);
                  },
                ),
              ),
            ),
          ],
        ),
        // this widget listen  to state change and update the UI according to HomeBloc logic
        // now the fechdata event is triggered in the upper provider part the state is either succes or fail
        // we can also use this method to trigger the fetch event with out button ....

        //  void initState() {
        //       super.initState();
        //       context.read<HomeBlock>().add(FetchData());
        //     }

        // or we can also do it like this when creating provider === create: (context) => getIt.get<HomeBlock>()..add(FetchData()),
        body: BlocBuilder<HomeBlock, HomeState>(builder: (context, state) {
          if (state is FetchLoading) {
            return Center(
                child: LoadingAnimationWidget.newtonCradle(
                    color: Colors.black, size: 440));
          } else if (state is FetchFailure) {
            return Text(state.error);
          } else if (state is FetchSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 30, 35, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Available Products",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<SearchBloc>()
                              .add(HoldDataEvent(state.product));
                          // context.read<SearchBloc>().emit(TEST(state.product));

                          Navigator.pushNamed(context, '/search');
                        },
                        child: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                // refere to fill the remaining place whith the child i provid you , strech
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ProductCard(products: state.product)),
                ),
              ],
            );
          }
          return Text("Hello I am just opening");
        }),
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 20),
          width: 70,
          height: 70,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, '/crudepage');
            },
            backgroundColor: Color(0xFF3F51F3),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
          ),
        ));
  }
}
