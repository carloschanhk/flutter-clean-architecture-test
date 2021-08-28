import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/layout/home/home_page_binding.dart';
import 'package:clean_architecture_test/local/note/note.dart';
import 'package:clean_architecture_test/router/app_pages.dart';
import 'package:clean_architecture_test/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.HOME,
      initialBinding: HomePageBinding(),
      title: 'Clean Architecture',
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}

initHive() async {
  await Hive.initFlutter();
  registerAdapter();
  await Hive.openBox<Note>('notes');
  await Hive.openBox<int>('count');
}

registerAdapter() {
  Hive.registerAdapter(NoteAdapter());
}
