// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employeeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) {
  return EmployeeResponse(
    json['code'] as int?,
    json['message'] as String?,
    Employee.fromJson(json['employee'] as Map<String, dynamic>),
    json['isValid'] as bool?,
    json['isSuccessStatusCode'] as bool?,
  );
}

Map<String, dynamic> _$EmployeeResponseToJson(EmployeeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'employee': instance.employee,
      'isValid': instance.isValid,
      'isSuccessStatusCode': instance.isSuccessStatusCode,
    };
