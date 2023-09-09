import 'package:lemfy_task_in_flutter/app/modules/students/data/models/student_model.dart';

abstract interface class StudentServiceInterface {
  Future<List<StudentModel>> getStudents();
}
