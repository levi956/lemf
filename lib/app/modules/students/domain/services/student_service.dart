import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/data/models/student_model.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/domain/services/interfaces/student_service_interface.dart';
import 'package:lemfy_task_in_flutter/core/framework/http/http.dart';
import 'package:lemfy_task_in_flutter/core/framework/http/http_extensions.dart';
import 'package:lemfy_task_in_flutter/core/framework/stream_state/stream_state.dart';

@LazySingleton(as: StudentServiceInterface)
class StudentService implements StudentServiceInterface {
  @override
  Future<List<StudentModel>> getStudents() async {
    final r = await HTTP.get('students');

    if (r.is200or201) {
      List<dynamic> body = jsonDecode(r.body);
      final students = body.map((e) => StudentModel.fromJson(e)).toList();
      return students;
    }
    throw AppException.fromResponse(r);
  }
}
