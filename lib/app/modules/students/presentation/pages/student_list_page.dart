import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/presentation/controller/get_students_controller.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/presentation/pages/components/student_tile_component.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  late GetStudentsController getStudentsController;

  @override
  void initState() {
    getStudentsController = getIt<GetStudentsController>();
    getStudentsController.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'List of students',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF303030),
            fontSize: 16,
          ),
        ),
      ),
      body: getStudentsController.buildWhen(
        success: (students) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: students.length,
                    separatorBuilder: (_, index) => const Divider(),
                    itemBuilder: (_, index) {
                      final student = students[index];
                      return StudentTileComponent(student);
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        failure: (e) => const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
