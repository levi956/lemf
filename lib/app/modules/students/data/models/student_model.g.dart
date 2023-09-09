// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentModel _$$_StudentModelFromJson(Map<String, dynamic> json) =>
    _$_StudentModel(
      createdAt: json['createdAt'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      age: json['age'] as int,
      department: json['department'] as String,
      profileId: json['profileId'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_StudentModelToJson(_$_StudentModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'age': instance.age,
      'department': instance.department,
      'profileId': instance.profileId,
      'id': instance.id,
    };
