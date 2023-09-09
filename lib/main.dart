import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/presentation/pages/student_list_page.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';

import 'core/framework/environment/environment.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentSetup.run(environment: Environment.test);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lemfy in Flutter',
      home: StudentListPage(),
    );
  }
}
