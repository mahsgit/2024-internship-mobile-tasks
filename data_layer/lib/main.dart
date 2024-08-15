import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product/presentation/bloc/addbloc/add_bloc.dart';
import 'features/product/presentation/bloc/homebloc/home_block.dart';
import 'features/product/presentation/bloc/homebloc/home_event.dart';
import 'features/product/presentation/bloc/homebloc/home_state.dart';
import 'features/product/presentation/pages/crudpage.dart';
import 'features/product/presentation/pages/search.dart';
import 'features/product/presentation/widgets/popups.dart';
import 'features/product/presentation/widgets/productcard.dart';
import 'DI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
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
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
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
        body: BlocBuilder<HomeBlock, HomeState>(builder: (context, state) {
          if (state is FetchLoading) {
            return Text("Loading...");
          } else if (state is FetchFailure) {
            return Text(state.error);
          } else if (state is FetchSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // padding: const EdgeInsets.all(30.0),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()),
                          );
                        },
                        child: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
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
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Crudpage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
              ));
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
