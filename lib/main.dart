import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce/core/repository/firebase_repo.dart';
import 'package:flutter_commerce/locator.dart';
import 'package:flutter_commerce/ui/views/_my_homepage.dart';
import 'package:flutter_commerce/ui/shared/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<FirebaseRepository>()),
      ],
      child: MaterialApp(
        title: 'Flutter Commerce',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.deepOrange,
        ),
        home: MyHomePage(title: 'home page'),
        initialRoute: '/',
        onGenerateRoute: MyRouter.generateRoute,
      ),
    );
  }
}
