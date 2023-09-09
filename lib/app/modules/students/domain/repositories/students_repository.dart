import 'package:injectable/injectable.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/data/models/student_model.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/domain/repositories/interfaces/student_repository_interface.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/domain/services/interfaces/student_service_interface.dart';

@LazySingleton(as: StudentRepositoryInterface)
class StudentRepository implements StudentRepositoryInterface {
  final StudentServiceInterface studentSerivce;

  StudentRepository(this.studentSerivce);

  @override
  Future<List<StudentModel>> getStudents() async {
    return await studentSerivce.getStudents();
  }
}
