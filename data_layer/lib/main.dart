import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'features/product/presentation/pages/crudpage.dart';
import 'features/product/presentation/pages/search.dart';
import 'features/product/presentation/widgets/popups.dart';
import 'features/product/presentation/widgets/productcard.dart';
import 'features/product/presentation/widgets/productmodel.dart';


const MaterialColor customColor = MaterialColor(
  _customColorPrimaryValue,
  <int, Color>{
    50: Color(0xFFe3f2fd),
    100: Color(0xFFbbdefb),
    200: Color(0xFF90caf9),
    300: Color(0xFF64b5f6),
    400: Color(0xFF42a5f5),
    500: Color(_customColorPrimaryValue),
    600: Color(0xFF1e88e5),
    700: Color(0xFF1976d2),
    800: Color(0xFF1565c0),
    900: Color(0xFF0d47a1),
  },
);

const int _customColorPrimaryValue = 0xFF2196F3;

void main() {

  runApp(
   ChangeNotifierProvider(
    create:(context) => Productsofall(),
     child: MyApp()));
    
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    
    MaterialApp(
      theme: ThemeData(
        primarySwatch: customColor, // Use your custom MaterialColor
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
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
        body: Column(
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Search()),
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
                child: Consumer<Productsofall> (builder: (context,productofall,child){
                return  ProductCard(products: Productsofall.productList);
                },),
              ),
            ),
          ],
        ),
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
