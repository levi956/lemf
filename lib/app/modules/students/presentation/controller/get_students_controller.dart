import 'package:injectable/injectable.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/data/models/student_model.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/domain/repositories/interfaces/student_repository_interface.dart';
import 'package:lemfy_task_in_flutter/core/framework/base_controller/base_controller.dart';

@lazySingleton
class GetStudentsController extends NoArgBaseController<List<StudentModel>> {
  GetStudentsController({
    required StudentRepositoryInterface repository,
  }) : super(function: repository.getStudents);
}
