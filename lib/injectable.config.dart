// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/modules/students/domain/repositories/interfaces/student_repository_interface.dart'
    as _i5;
import 'app/modules/students/domain/repositories/students_repository.dart'
    as _i6;
import 'app/modules/students/domain/services/interfaces/student_service_interface.dart'
    as _i3;
import 'app/modules/students/domain/services/student_service.dart' as _i4;
import 'app/modules/students/presentation/controller/get_students_controller.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.StudentServiceInterface>(() => _i4.StudentService());
    gh.lazySingleton<_i5.StudentRepositoryInterface>(
        () => _i6.StudentRepository(gh<_i3.StudentServiceInterface>()));
    gh.lazySingleton<_i7.GetStudentsController>(() => _i7.GetStudentsController(
        repository: gh<_i5.StudentRepositoryInterface>()));
    return this;
  }
}
