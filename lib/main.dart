import 'package:clean_architecture_test/counter/counter_page.dart';
import 'package:clean_architecture_test/counter/counter_page_view_model.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/local/note.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');

  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
