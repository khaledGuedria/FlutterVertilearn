import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/inherited_component.dart';
import 'package:myapp/invoice_details_screen.dart';
import 'package:myapp/invoices_screen.dart';
import 'package:myapp/profile_screen.dart';
import 'invoice_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        routes:  {
          LaunchScreen.routeName :(context) => const LaunchScreen(),
          InvoiceDetails.routeName :(context) => const InvoiceDetails(),
        });
        //home: const LaunchScreen());
  }
}

class LaunchScreen extends StatefulWidget {
  //var
  static const String routeName = '/';
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  //vqr
  int mIndex = 0;
  var screens = const [
    HomeScreen(),
    InvoicesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomSheet: Text('data'),
        appBar: AppBar(
        ),
        drawer: Drawer(
            child: Scaffold(
          appBar: AppBar(),
        )),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: mIndex,
            onTap: (value) {
              setState(() {
                mIndex = value;
              });
            },
            items: const [
              //1
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              //2
              BottomNavigationBarItem(
                  icon: Icon(Icons.file_copy), label: 'Invoices'),
              //3
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ]),
        body: screens[mIndex]);
  }
}
