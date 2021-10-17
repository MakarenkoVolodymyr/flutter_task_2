import 'package:flutter/material.dart';
import 'package:flutter_task_2/models/contactModel.dart';
import 'package:flutter_task_2/models/listModel.dart';
import 'package:flutter_task_2/screens/contact/contactScreen.dart';
import 'package:provider/provider.dart';
import 'screens/list/contactList.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListModel(),
      child: MaterialApp(
          routes: {
            ContactScreen.routeName: (context) => const ContactScreen(),
          },
          debugShowCheckedModeBanner: false,
          home: ContactList()
      ),
    );
  }
}
