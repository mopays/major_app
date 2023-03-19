import 'package:flutter/material.dart';
import 'package:major_app/page1.dart';
import 'package:provider/provider.dart';

import 'class/fav.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       home: ChangeNotifierProvider(create: (context)=> Fec(),
       child: const MaterialApp(
        home:  Page1(),
       ),),
    );
  }
}
